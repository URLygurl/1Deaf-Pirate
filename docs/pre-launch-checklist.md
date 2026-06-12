# Pre-Launch Checklist — Before the Squad Goes Live

> Don't let them loose. Let them *out*, one capability and one agent at a time,
> through these gates. The squad earns autonomy; it isn't handed it on minute one.

Two halves: **operational readiness** (does it work) and **security & containment**
(can it hurt anything). Nothing flips to `live` until its gates are ticked.

## 🔒 Security & containment (corral the madness)

### Network / internet egress — the master leash
- [ ] **Start fully contained.** First runs have **no outbound internet** —
      prove behaviour before granting reach.
- [ ] **Scope the `web` toolset per profile.** Only agents that genuinely need the
      internet get it; knowledge agents work from their skills + HIVE. (Hermes
      toolset scoping — set in each profile's `config.yaml`.)
- [ ] **OS/container-level egress control** for the real leash. ⚠️ Honest flag:
      **Hermes profiles do NOT sandbox** — an agent has the same FS/network access
      as the user running it. Real containment = run the squad in a
      container/sandbox with a **network allow-list** (like this dev environment's
      network policy), not Hermes config alone.
- [ ] **Allow-list, don't deny-list.** When internet is granted, grant *specific
      domains* (the skill source sites, APIs) rather than open egress.
- [ ] **iron-proxy egress firewall (Hermes-native).** Hermes ships an iron-proxy
      integration — the recommended **production** egress leash. Route the squad's
      traffic through it with a **domain allow-list** so an agent can only reach
      sanctioned hosts. This is the concrete answer to the "no sandbox" flag above.
      See `docs/production-hardening.md`. _(Verify exact config on the box first.)_
- [ ] _To verify when wiring:_ Hermes `terminal.backend` sandbox options (e.g.
      docker backend) for per-agent isolation.

### Gateway / messaging channels — gate the front door
> The gateway runs as a persistent service (`hermes-gateway.service`). On first
> start it warns: **"No user allowlists configured"** and **"No messaging platforms
> enabled."** The second is the safe default (no inbound surface). The first is the
> gate below.
- [ ] **Allowlist BEFORE enabling any channel.** Never turn on a messaging platform
      (Telegram/Discord/Slack/WhatsApp/Signal/Email/SMS) until a **user allowlist**
      is set — otherwise anyone who finds the channel can message the squad.
- [ ] **One channel at a time, allow-listed**, proving each before the next (mirrors
      the progressive-trust ramp).
- [ ] **NEIL stays send-less at the front.** The exposed concierge drafts/triages
      only; any actual send/call is held at the **action-lock** (or routed to a
      gated *internal* sender) — never on the public profile.

### Vulnerability scanning
- [ ] **Scan the repo + plugins** before launch — the `hive-loop` / `reveal-gate`
      Python, plus any agent deps. (Run the `/security-review` skill on the branch;
      add a CI scan.)
- [ ] **GitHub secret scanning** on the repo (catch any committed key) — and confirm
      `.env` is gitignored (it is).
- [ ] Re-scan on every dependency or plugin change.

### Dependency / package monitoring
- [ ] **Pin + monitor** all Python deps (Honcho, Hindsight clients, plugin libs).
      `pip-audit` in CI; Dependabot (or equivalent) on the repo.
- [ ] **Vet third-party plugins** before enabling — Hermes plugins run arbitrary
      code; the `plugins.enabled` allow-list is the gate (only opt in what we trust).
- [ ] Lockfile committed; review every new transitive dep.

### Secrets & identity
- [ ] **Bitwarden secrets manager (Hermes-native).** Hermes ships a Bitwarden
      integration — the recommended **production** secrets store. Migrate keys out
      of plaintext `.env` into Bitwarden so secrets are vaulted, rotated, and pulled
      at runtime. See `docs/production-hardening.md`. _(Verify exact config on the
      box first.)_
- [ ] All keys (Anthropic, Honcho, Hindsight) + a **distinct bot token per profile**
      held in the secrets store (Bitwarden in prod; `.env` only as a local fallback,
      never committed). Hermes token-locks dup bot tokens.
- [ ] Least-privilege API keys (scoped tokens where the provider supports it).

### Kill switch & observability
- [ ] Confirm you can **see** (`/agents`, Kanban dashboard) and **kill** any worker
      mid-flight without stopping its siblings.
- [ ] `kanban.failure_limit` set so thrashing tasks auto-block (no runaway loops).
- [ ] Logs/audit on: `hermes/observability/`, Kanban task_events, HIVE capture.

## ✅ Operational readiness

- [ ] **Identity complete** per character — `soul/brain/tuning/god/pintent` + `skills/`.
- [ ] **Descriptions derived + peer-reviewed + de-conflicted** (intent-authoring):
      no gaps, no overlap, **no orphan triggers**.
- [ ] **Toolsets scoped** — knowledge agents have no `terminal`/`send_message`;
      **DIO (power) and OZZY (amps) stay advice-only** (caveats already in skills).
- [ ] **Outward actions gated** — gateway messages / posting / email behind HITL.
- [ ] **Memory persists AND survives a restart** — write a learning → restart →
      confirm it's still in Honcho **and** `hive/` (git). The 10-hour-loss test.
- [ ] **One safe end-to-end dry run** — `you → DIME routes → worker → HIVE → DIME
      synthesises → you`, harmless task, watched on the board.

## 🐣 Progressive-trust ramp (baby steps)

Reveal isn't just *which agent* is live — it's *which capability*. Widen one notch
at a time, proving the previous notch first:

1. **Contained** — DIME + NEIL only, no internet, scoped tools, double-HITL.
2. **Read-only reach** — grant `web` to the agents that need it, allow-listed domains.
3. **Write/act, supervised** — outward actions with HITL on every one.
4. **Autonomous, bounded** — cron/Kanban runs, still inside the container + audit.
5. **Widen the roster** — one character at a time, each through its own gates.

Each step is a deliberate sign-off, logged. A bad notch rolls back to the previous
one — it never jumps ahead.
