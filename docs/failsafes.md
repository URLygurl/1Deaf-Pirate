# Failsafe Lockdowns — The Kill Rig

> The risk isn't rebellion — it's a confident mistake made fast, 15× in parallel.
> Failsafes are the fire marshal and the kill switch within arm's reach. A crew
> with this much ability and soul earns a serious safety rig, not a leash of fear.

Design principle: **graduated blast radius.** Every failsafe targets the smallest
scope that contains the problem, and any tier can be tripped **manually by you** or
**automatically by a circuit breaker.** When in doubt, trip the bigger one — it's
always cheaper to restart than to clean up.

## The blast-radius ladder (manual kill switches)

| Tier | Scope | How to pull it | Reversible? |
| --- | --- | --- | --- |
| 0 | **One task** | `/agents` or Kanban dashboard → kill/pause that worker (siblings keep running) | yes |
| 1 | **One agent** | flip its `reveal-gate` status off → unassignable; or `<profile> gateway stop` | yes |
| 2 | **One capability, squad-wide** | add the tool to `hive/4-permissions/deny.txt` (hive-loop blocks it for everyone); remove a toolset; `delegation.orchestrator_enabled: false` (no nested spawning); `hermes memory off` | yes |
| 3 | **Freeze the whole squad** | **stop the gateway** → the Kanban dispatcher lives in it, so nothing new spawns and in-flight children are cancelled (`delegate_task` is synchronous) | yes |
| 4 | **Break glass — everything off NOW** | container `stop`/`pause` **+** cut network egress **+** revoke/rotate the model API keys (no model = no agents) | yes, deliberate restart |

Tier 4 is the big red button: even if software misbehaves, **no API key = no
inference = the squad cannot think or act.** That is the ultimate off switch and it
lives outside the agents' reach.

## Circuit breakers (auto-trip, no human in the loop)

Conditions that should trip a failsafe *automatically*, wired via the `hive-loop`
hooks + Kanban limits:

| Trip condition | Auto-action | Mechanism |
| --- | --- | --- |
| Repeated tool **permission denials** | block that agent (Tier 1) | `post_tool_call` hook counts denials → writes `freeze` flag |
| **Thrashing** task (repeated spawn/exec failures) | auto-block the task (Tier 0) | `kanban.failure_limit` (native) |
| **Spend / token** over budget per turn or per day | freeze squad (Tier 3) | monitor + hook _(verify native budget cap; else implement)_ |
| Unexpected **network egress** (non-allow-listed domain) | cut egress (Tier 2/4) | OS/container firewall, not Hermes |
| Worker touches a **forbidden path** | block tool + agent | `pre_tool_call` hook deny |
| **Loop / runaway** (no progress, N iterations) | kill worker (Tier 0) | `max_iterations`, `child_timeout_seconds` (native) |

### The `freeze` flag (software panic button we build)
A single file, e.g. `hive/4-permissions/FREEZE`. The `hive-loop` `pre_tool_call`
hook checks it first: **if present, deny every tool call with a "squad frozen"
message.** One `touch FREEZE` halts all action squad-wide without killing processes;
`rm FREEZE` resumes. Cheap, instant, reversible — the soft Tier-3.

## Containment that doesn't depend on the agents behaving

**The squad runs on a DigitalOcean Droplet** (cloud VM — currently a small CPU box,
`pirates-s-1vcpu-2gb-syd1` in SYD1). Honest trust-chain note: it's **not** physical
ownership — DigitalOcean (and the underlying cloud) sit in the trust chain. DO gives
you **Cloud Firewalls, monitoring/alerts, and full console control** of the Droplet.
There's no literal "pull the cable" — the equivalent is **power-off or destroy the
Droplet** from the DO console.

Architecture on DigitalOcean: one **Droplet** runs the Hermes host (all 15 profiles
+ Kanban) and the **self-hosted brains** (Honcho/Hindsight local). Unlike the old
Lightning plan, this CPU box does **not** serve local GPU inference — the model is
**Claude via the Anthropic API**. So the model "off-switch" here is **revoke the API
key**, not "stop a local inference server." (Owned/local GPU inference returns at
**Phase 7**, on your own hardware — see `roadmap.md`.)

⚠️ Hermes profiles **do not sandbox** (same FS/network reach as the host user). So
the hard failsafes live **below** Hermes — on DigitalOcean that means:

- **Process/host:** power-off or destroy the Droplet from the DO console. Atomic
  halt of everything.
- **Model access:** revoke/rotate the `ANTHROPIC_API_KEY` (Anthropic Console) → the
  squad can't think.
- **Network egress:** in-guest firewall (ufw) **+ DigitalOcean Cloud Firewalls**
  with a domain/IP allow-list (the real leash — yours to set).
- **Spend + audit:** Anthropic Console usage caps/billing limits for model spend; DO
  monitoring/alerts for the box; Hermes' own audit logs + Kanban `task_events` for
  the agent trail.
- **Credentials:** API keys live in the box's `.env` (gitignored), revocable in the
  Anthropic Console without touching an agent.

- **Network:** OS/container egress firewall with a domain allow-list. Pull it and
  the squad is deaf to the outside world instantly.
- **Filesystem:** run in a container with only the needed paths mounted; mount the
  rest read-only. An agent can't wreck what it can't write.
- **Process:** container `pause`/`stop` halts everything atomically.
- **Credentials:** keys held by the host/container env, revocable without touching
  any agent. The squad never holds its own off switch.

## Recovery (how to come back after a trip)

A trip is not a failure — it's the rig working. To resume safely:

1. **Read the audit** — Kanban `task_events`, `hive/1-capture/log.jsonl`, the
   timeout/diagnostic logs. Find *what* tripped it.
2. **Capture the lesson** — write the correction to `hive/5-feedback-loops/` so it
   becomes a rule (the mistake can't repeat).
3. **Roll back one trust notch** (see `pre-launch-checklist.md` ramp) — don't resume
   at full autonomy; drop to the last proven level.
4. **Clear the failsafe** (`rm FREEZE`, re-enable, re-key) and re-prove the notch
   before widening again.

## What's already in place vs. to build

- **Built (this repo):** `reveal-gate` (Tier 1), `hive-loop` `pre_tool_call` deny
  (Tier 2) — the `FREEZE` flag is a tiny addition to that same hook.
- **Native (Hermes):** `/agents` kill, Kanban kill/pause + `failure_limit`,
  `orchestrator_enabled`, `max_iterations`, `child_timeout_seconds`, `memory off`,
  gateway stop, `plugins.disabled` deny-list.
- **To stand up (OS/container):** egress firewall + allow-list, read-only mounts,
  revocable host-held credentials.
- **To verify when wiring:** native spend/budget caps; Hermes `terminal.backend`
  sandbox options.
