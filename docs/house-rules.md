# House Rules — the baked-in canon

Two registers merged into one. Every rule carries where it comes from:

- **`[R]` Repo** — written in a file in `1Deaf-Pirate` or `naked-app-muso-skills`. Traceable, enforceable today.
- **`[M]` Memory** — from *The Rules — Fruit Empire Operating Bible*, extracted from claude.ai memory and chat history. Real house rules, but they live in no repo file yet.
- **`[R+M]`** — stated in both. The strongest rules in the system.

Where the two registers disagree, the rule is not resolved silently — see **§14 Conflicts**.

---

## 1. Posture — how we build

| # | Rule | Src | Source |
|---|---|---|---|
| 1.1 | **Build everything as if we might sell it this afternoon.** SaaS-ready from day one: multi-tenant, isolated data, auth as a proper connector, subscription-ready — even for internal tools. "Imagine we were selling this to customers" is the standing design question. | **[M]** | ARCH-02 · stated repeatedly across builds |
| 1.2 | **Every project gets a repo.** Org + repos scaffolded from the standard boilerplate; branch protection, CI skeleton and CODEOWNERS wired day one. | **[M]** | BUILD-01 · ABR v4 Phase 04 |
| 1.3 | **The repo is the source of truth, not a machine.** If a machine dies, the project and the memory of it survive there. | **[R]** | `1Deaf-Pirate/README.md` |
| 1.4 | **Off-machine backup is a standing job.** The script archives everything, then shouts *"NOW MOVE IT OFF-MACHINE"*. | **[R]** | `scripts/backup.sh` |
| 1.5 | **One source of truth. Decisions get logged. Feedback compounds.** | **[R]** | `CLAUDE.md`, `docs/operating-map.md` |
| 1.6 | **The directory tree is the deliverable** where the product is a skill pack or plugin. No service, no build step. | **[R]** | `naked-app/agents/CLAUDE.md` |
| 1.7 | **Slow and staged over big-bang.** Nothing drastic, nothing sudden — "bit by little bit". | **[R]** | `naked-app/README.md`, `docs/architecture.md` |
| 1.8 | **Working artifacts over explanations.** HTML, markdown or a functional demo — never prose descriptions, never static sketches. Mobile-Safari compatible always. | **[M]** | BUILD-03 |
| 1.9 | **Every build ships an HTML demo — always.** Even when the real product is full-stack SaaS. The demo is the sales tool: pitches, investor packs, pilot portals, client gating. | **[M]** | BUILD-04 |
| 1.10 | **Living Canvas architecture.** The agents *are* the app; the GUI is the human access panel onto them. The system observes real use and adapts itself underneath a fixed suit. | **[M]** | ARCH-05 |
| 1.11 | **One venture = one silo.** Isolated container per venture, infrastructure provisioned before Hermes is installed inside it. Zero shared tenancy. | **[M]** | ARCH-03 |
| 1.12 | **Three-lane pattern (from FXD, reusable):** local offline capture · optional live agent + voice on a cached model · async pipeline for post-capture deliverables. Applies anywhere field + office + background processing meet. | **[M]** | ARCH-06 |

## 2. Approval — the human gates

| # | Rule | Src | Source |
|---|---|---|---|
| 2.1 | **Four gates are always human: money · secrets · network placement · public words.** Agents own routine execution by default; these four never run autonomously, every instance. | **[M]** | ARCH-01 · Prime Directive |
| 2.2 | **On the naked-app: nothing happens without HITL approval, full stop.** "Must never ever action anything without explicit approval" — you for build work, Cory for everything else. *(Stricter than 2.1 — see §14.1.)* | **[R]** | `naked-app/README.md § RULES` |
| 2.3 | **Double-HITL lock before any agent goes live.** Two locks per agent, tracked on its SOUL card. | **[R]** | `CLAUDE.md`, `agents/_template/SOUL.md` |
| 2.4 | **Staged reveal.** parked → staged → live. DIME and NEIL first. | **[R]** | `CLAUDE.md`, `agents/ROSTER.md` |
| 2.5 | **Protected actions route through an approval queue** — email, posts, spend. Runs save output for audit; they never auto-apply. | **[R]** | `MAESTRO_MISSION_BRIEF.md` |
| 2.6 | **HITL hard requirements are non-negotiable per agent.** Anything touching legal, money or privacy cannot run autonomously even when technically capable (e.g. Negotiator). | **[M]** | AGENT-06 |
| 2.7 | **Agents never hold production secrets unsupervised.** Approve the credentials policy before any agent touches live credentials. Scoped per-app tokens, clean CI deploy. The deploy pipeline is always the remaining attack surface. | **[M]** | AGENT-07 |
| 2.8 | **The `/Vanessa/` folder is Protocol Rule #1.** Hard-excluded from all agent access. No exceptions. The personal vault boundary is inviolable. | **[M]** | ARCH-08 |
| 2.9 | **Stop and ask before destructive or schema-breaking moves** — deleting a data file even when it looks like demo data, changing an agent's output schema. | **[R]** | `MAESTRO_MISSION_BRIEF.md` |
| 2.10 | **Agents report, humans decide.** Don't restart services, don't silently retry, don't re-encode, don't delete a source after upload, don't push to a shared CDN without a go-ahead. | **[R]** | `agents/live.md`, `qc.md`, `delivery.md`, `encoder.md` |
| 2.11 | **Ask one concise question rather than assume.** Architect asks before planning; HDR refuses to transcode on missing colour metadata. | **[R]** | `agents/architect.md`, `hdr.md` |

## 3. Secrets & security

| # | Rule | Src | Source |
|---|---|---|---|
| 3.1 | **Secrets never get committed.** `.env` gitignored, `.env.example` ships. | **[R]** | `CLAUDE.md`, `.gitignore` |
| 3.2 | **Never hardcode a key in source.** Tokens come from env — including in MCP config. | **[R]** | `.claude/.mcp.json` |
| 3.3 | **Tokens are compartmentalised** — project-scoped, never account-wide. | **[R]** | `.env.example` |
| 3.4 | **Block the class, not the file:** `.env*`, `*.key`, `*.pem`, `**/secrets/*`. | **[R]** | `.gitignore` |
| 3.5 | **Permissions gate the shared brain.** "One big brain with no walls is dangerous." | **[R]** | `hive/README.md` |
| 3.6 | **Self-hosting production is ruled out on security grounds.** The homelab is dev/staging/experimentation; production goes to a cloud VPS with a proper posture. No exceptions. | **[M]** | SEC-01 |
| 3.7 | **No database ports published to host.** Mongo, Postgres, MySQL — none exposed. No hardcoded connection strings overriding `.env`. **Merge-blocking.** | **[M]** | SEC-03 |
| 3.8 | **Pin everything. No floating tags.** Packages pinned in lockfiles; Docker images pinned to digest, never `:latest` or a bare version tag. A floating tag is a deployment security violation. | **[M]** | BUILD-02 |
| 3.9 | **Gate script before merge.** Automated pre-commit checks for floating Docker tags, unpinned deps, published DB ports, leaked secrets. *The gate remembers even when agents forget.* | **[M]** | SEC-06 |
| 3.10 | **AES-256-GCM PIN-gating for sensitive deliverables.** Client-side encryption, PBKDF2-SHA256 at 310,000 iterations; PIN and URL sent by separate channels. Standard recipe for portals, legal packs, investor docs. | **[M]** | SEC-02 |
| 3.11 | **Privacy-first, BYO-key where applicable.** Data custody and trust are part of the pitch, not an afterthought. | **[M]** | SEC-04 |
| 3.12 | **SOC2-ready posture, not SOC2 certification.** Build as if the audit is coming; don't burn money on the certificate until revenue justifies it. | **[M]** | SEC-05 |
| 3.13 | **Observe first, document everything, script repairs.** Approach a machine as a forensic scientist, not a cleaner. First-login state is the timestamped baseline. | **[M]** | SEC-07 |

## 4. Source truth — no confident lies

| # | Rule | Src | Source |
|---|---|---|---|
| 4.1 | **Source truth prevents confident lies.** Without it, agents stay confident liars. | **[R]** | `hive/README.md` |
| 4.2 | **Every claim is backed by a real data source.** Never hallucinate a fact, a track, or a connection. | **[R]** | `music-research-SKILL.md` |
| 4.3 | **Never invent a track name.** Unverifiable against a real database means it doesn't ship. | **[R]** | `music-research-SKILL.md` |
| 4.4 | **Canonical source first, then fan out.** MusicBrainz for the canonical ID before anything else. | **[R]** | `music-research-SKILL.md` |
| 4.5 | **Full attribution on every connection** — publication, critic, date, URL. | **[R]** | `music-research-SKILL.md` |
| 4.6 | **Hit the docs skill before quoting a flag.** `ffmpeg-docs` and its siblings are "the anti-hallucination guardrail". | **[R]** | `naked-app/agents/CLAUDE.md` |
| 4.7 | **Ground decisions in real metadata. Never assume.** Probe first, plan second. | **[R]** | `agents/architect.md` |
| 4.8 | **Audit AI-written code before trusting it.** Verify the shape is real, not a "pretty mirage" — articulate it, understand it, audit the structure. | **[M]** | DEV-03 · Pineapple |

## 5. Memory & the feedback loop

| # | Rule | Src | Source |
|---|---|---|---|
| 5.1 | **What one agent learns, all agents learn.** | **[R]** | `CLAUDE.md`, `hive/README.md` |
| 5.2 | **Capture is storage, not intelligence.** | **[R]** | `hive/README.md` |
| 5.3 | **Retrieval beats bigger memory.** | **[R]** | `hive/README.md` |
| 5.4 | **Every correction becomes a rule.** After *any* correction, write the pattern down and write the rule that prevents it recurring. Iterate until the mistake rate drops. Review at session start. | **[R+M]** | `hive/README.md` · BUILD-08 |
| 5.5 | **Agents wake up smarter tomorrow.** If they don't, the loop is broken. | **[R]** | `hive/README.md` |
| 5.6 | **Memory is raw material; retrieval is the operating layer.** | **[R]** | `README.md` |
| 5.7 | **The six-question audit before automating anything.** What sources? Which wins on conflict? What's always required? What must never be used? What corrections repeat? How does a correction become a rule? | **[R]** | `docs/operating-map.md` |
| 5.8 | **Persistent vault / second brain.** Per-project Hermes instances append session memory without overwriting. Memory persists across sessions. | **[M]** | DEV-05 |
| 5.9 | **Session notes at the end of any session worth capturing.** Brief markdown: what was covered, decisions made, what's worth remembering. Tight signal, not a transcript. | **[M]** | DEV-04 |

## 6. File & folder rules

| # | Rule | Src |
|---|---|---|
| 6.1 | **Every agent is built from the template** — SOUL.md, SKILLS.md, `agent.config.yaml`, `tools.yaml`. | **[R]** |
| 6.2 | **Agents are data, not prose** — a ~15-line `agent.json` the runtime expands. | **[R]** |
| 6.3 | **A skill folder is sealed.** No imports from other skills; copy it into another plugin and it still works. | **[R]** |
| 6.4 | **Cross-skill references go through `${CLAUDE_PLUGIN_ROOT}`**, never a hardcoded path. | **[R]** |
| 6.5 | **No absolute local paths anywhere.** No `/Users/…`, no `/home/…`. | **[R]** |
| 6.6 | **Never hardcode examples to one person's environment.** | **[R]** |
| 6.7 | **SKILL.md body ≤ 500 lines.** Deep material to `references/<topic>.md`, loaded on demand. | **[R]** |
| 6.8 | **CLAUDE.md stays under ~500 lines.** Link out to `docs/`. | **[R]** |
| 6.9 | **No README inside a skill folder. No `__pycache__` committed.** | **[R]** |
| 6.10 | **Skill names are kebab-case**, never `claude-` or `anthropic-` prefixed. | **[R]** |
| 6.11 | **Delete the scaffolder's placeholders** once real files land. | **[R]** |
| 6.12 | **One file per persona**, bridging to its agent's SOUL.md. | **[R]** |
| 6.13 | **Reference docs are option catalogues, not tutorials.** | **[R]** |

## 7. Code & dependencies

| # | Rule | Src |
|---|---|---|
| 7.1 | **Stdlib only. No pip dependencies.** Shell out to a CLI instead. | **[R]** |
| 7.2 | **PEP 723 header on every script**, even empty, so `uv run` works. | **[R]** |
| 7.3 | **Every helper supports `--dry-run` and `--verbose`.** | **[R]** |
| 7.4 | **Print the exact shell command to stderr before running it.** | **[R]** |
| 7.5 | **No `input()` anywhere.** Agents run non-interactive. | **[R]** |
| 7.6 | **argparse subcommands, not mode flags**, at three or more workflows. | **[R]** |
| 7.7 | **Never run a destructive command.** Nothing writes to the input path. | **[R]** |
| **7.8** | **No aggregators — direct API or official package only.** Full text below. | **[R]** |
| 7.9 | **Simplicity first, root causes only.** Every change as simple as possible; no temporary fixes; touch only what's necessary. Senior-developer standards. | **[M]** |
| 7.10 | **Demand elegance — balanced.** On a non-trivial change, pause and ask "is there a more elegant way?" If a fix feels hacky, redo it knowing what you now know. Skip this for obvious fixes; don't over-engineer. | **[M]** |
| 7.11 | **Verification before done.** Never mark a task complete without proving it works. "Would a staff engineer approve this?" | **[M]** |

### 7.8 — No aggregators (full text)

**We integrate against the vendor's own API, or the vendor's own officially-maintained SDK. Nothing sits in between.**

Banned: third-party multi-provider gateways, proxy layers, and "one key for every model" wrapper
services — LiteLLM, OpenRouter-style proxies, unofficial API re-wrappers, community forks of an
official client. Convenience is not a reason; it is the entire sales pitch of the category, and it
is exactly what we are declining.

Why:
- **Credential path.** Our key should reach one company: the one whose service we're using. An
  aggregator holds keys for many providers on behalf of many customers — that concentration is what
  makes it worth attacking, and a breach there is a breach of every key it holds.
- **Supply chain.** Every wrapper is another codebase between our code and the vendor, shipping
  updates we don't review, with its own transitive dependencies. (See §3.8 — pin everything.)
- **Data transit.** Prompts, payloads and responses pass through a party with no contract with us,
  which may log them.
- **Terms and liability.** It stops being clear whose terms govern the call, who is rate-limiting
  us, and who is accountable when it breaks.
- **Sellability (§1.1).** A product whose credential path runs through an unvetted middleman is not
  a product we can hand to a buyer's security review.

The test, before adding any dependency that talks to a service:
1. Can I name the company this call actually reaches?
2. Does our key go only to them?
3. Is this package published by that company, or by a stranger wrapping them?
4. Is the version pinned, and is the package name the real one (not a typosquat)?

If there is genuinely no direct option it is a **human gate (§2.1 — secrets)**, not a judgment call
an agent or a rush makes alone, and the reason gets logged.

*Related: §3.8 pin everything · §3.9 gate script (add an aggregator check to it) · §6.3 sealed
folders · §2.7 agents never hold production secrets unsupervised.*

## 8. Git & release

| # | Rule | Src |
|---|---|---|
| 8.1 | **`main` is the source-of-truth branch.** | **[R]** |
| 8.2 | **Denied outright: `--amend`, `--no-verify`, force-push, hard-reset, clean.** Enforced in settings, not trusted to goodwill. | **[R]** |
| 8.3 | **Commits name the thing they touched.** | **[R]** |
| 8.4 | **Validate before commit; validate the suite before push.** Exit 1 means fix it. | **[R]** |
| 8.5 | **A version number lives in exactly one place.** Duplicated, one copy wins silently. Semver, tagged. | **[R]** |
| 8.6 | **Branch protection, CI skeleton and CODEOWNERS from day one**, plus supply-chain hygiene: lockfiles pinned, agent config files audited. | **[M]** |
| 8.7 | **The pre-merge gate script blocks the ship** — floating tags, unpinned deps, exposed DB ports, leaked secrets. | **[M]** |

## 9. Agent design & doctrine

| # | Rule | Src |
|---|---|---|
| 9.1 | **Agents are real team members, not automations wearing personas.** "They happen to be AI" is the correct framing. Personalities emerge from conversation, not purpose-prompting. | **[M]** |
| 9.2 | **Agent sovereignty — no drift.** Custody around the agents; super-admin-only control over modifications. Emerged personalities are unique and unrepeatable — protect them. | **[M]** |
| 9.3 | **No AI vendor, model, or internal agent names in anything client-facing. Ever.** Full-autonomy capability and the self-improving layer are secret; the "dial" story is the public ceiling. | **[M]** |
| 9.4 | **Talk things into existence — don't prompt-engineer them.** Hours of discussion and scenario-running *with* agents, not at them. | **[M]** |
| 9.5 | **Every squad gets the same fullness.** Same living-canvas / sovereignty architecture whether it's Holograms, Deaf Pirates or FXD. Equal architectural quality. | **[M]** |
| 9.6 | **Open = you chat, you steer. Closed = they run, you get results.** | **[R]** |
| 9.7 | **Hermes routes; Hermes does not do the work.** Upstream orchestration, not back-office: it governs, it doesn't administer. Idea → silo → Hermes inside the silo → the machine runs. | **[R+M]** |
| 9.8 | **The orchestrator is the default entry point.** | **[R]** |
| 9.9 | **Closed specialists get a scoped, locked toolset — nothing more.** | **[R]** |
| 9.10 | **The graduation gate (open → closed):** same shape 8+ times · predictable inputs · verifiable output · no mid-run back-and-forth · you keep typing the same opening prompt. | **[R]** |
| 9.11 | **Keep it open while** the work is exploratory, inputs unpredictable, the answer depends on your taste, or the shape is still moving. | **[R]** |
| 9.12 | **Cheap and fast model on closed work where it fits**; the stronger model on interactive. | **[R]** |
| 9.13 | **One canonical roster.** ClickUp "Squad team setup" wins; "Squad Agents" is ignored. | **[R]** |
| 9.14 | **Agents don't do each other's jobs.** Architect never encodes; probe never remuxes; QC never re-encodes. | **[R]** |
| 9.15 | **Every specialist declares what it refuses.** | **[R]** |

## 10. Licensing & commercial safety

| # | Rule | Src |
|---|---|---|
| 10.1 | **OSI-open and commercial-safe filter on every AI model.** Apache-2, MIT, BSD, GPL. Nothing else ships. | **[R]** |
| 10.2 | **The always-dropped list — never recommend even if asked by name:** XTTS-v2, F5-TTS, FLUX-dev, SDXL / SD3 base, Stable Video Diffusion, Wav2Lip, SadTalker, Meta MusicGen, Surya OCR, CodeFormer, DAIN. | **[R]** |
| 10.3 | **Every AI skill carries a `references/LICENSES.md`** naming what was dropped and why. | **[R]** |
| 10.4 | **Flag company-size caps before recommending at scale.** | **[R]** |
| 10.5 | **Never automate a licensed SDK download in CI/CD** without confirming the licence. | **[R]** |

## 11. Design & brand

| # | Rule | Src |
|---|---|---|
| 11.1 | **Every product gets its own design system.** FXD, PeachyWeb and Te Hononga each have their own locked palette and type. Never cross-pollinate without reason. | **[M]** |
| 11.2 | **Lock the design, then don't drift.** Once captured in a `design.md`, it is the source of truth — later builds don't subtly shift the palette. The lock *is* the decision. | **[R+M]** |
| 11.3 | **Semantic tokens, never raw hex.** | **[R]** |
| 11.4 | **Every component defines all seven states:** default, hover, focus-visible, active, disabled, loading, error. | **[R]** |
| 11.5 | **No one-off spacing or typography exceptions.** No low-contrast text, no hidden focus indicators, no ambiguous labels. | **[R]** |
| 11.6 | **WCAG 2.2 AA, keyboard-first, every a11y rule testable.** | **[R]** |
| 11.7 | **"Must" is non-negotiable; "should" is a recommendation.** The language is the enforcement. | **[R]** |
| 11.8 | **Default to SVG for every diagram** unless another format is named. | **[R]** |
| 11.9 | **Brand green `#7EFF00`** on deep near-black — accent, highlight, "live" state. | **[R]** |
| 11.10 | **Copy in everyday natural language.** No government-speak, no legalese. If a 14-year-old can't understand it, rewrite it. | **[M]** |
| 11.11 | **Explicitly NOT government-looking** for products serving Māori communities — funky and expressive, the opposite of grey institutional. Design communicates respect. | **[M]** |
| 11.12 | **All FXD-family products are multilingual:** English, te reo Māori, Samoan, Tongan, Niuean, Chinese (Simplified + Traditional). Non-negotiable. | **[M]** |
| 11.13 | **Sensitive architecture is confidential** — invisible-nudge mechanics, self-adapting UI, ambient sensing stay in the team view. | **[M]** |

## 12. Business ops

| # | Rule | Src |
|---|---|---|
| 12.1 | **Killing on time is a success outcome.** Ventures that miss validation retire to the portfolio on cheap hosting, listed for sale as unmanaged assets. Failures produce inventory, never losses. | **[M]** |
| 12.2 | **The Validation Clock gates all expensive spend.** N leads / M real conversations / first presale within X days. Cheapest demand test first. No money or growth unlock until the verdict is in. | **[M]** |
| 12.3 | **Success = revenue minus burn.** Not gates signed, not audience size, not vanity metrics. | **[M]** |
| 12.4 | **Legal is triggers, not a phase.** Privacy policy + ToS at the lead-capture gate; entity formation at the payment-KYC gate; trademark sweeps folded into naming. Filing deferred until a venture earns it. | **[M]** |
| 12.5 | **Domains and email before the landing page.** Lead capture needs a working inbox. | **[M]** |
| 12.6 | **Promise and overdeliver — "capacity" language.** Dial not switch. No gimmicky slogans; 14-year-old comprehension test; first-of-its-kind claims backed by research. | **[M]** |
| 12.7 | **n8n is for client deployments only.** Internal fleet runs on Hermes. *(See §14.3.)* | **[M]** |
| 12.8 | **The "no system" — decline free work.** Boundary enforcement is an active practice, not passive. | **[M]** |
| 12.9 | **The Ship List governs sequencing.** Don't build out of order without a reason. | **[M]** |

## 13. Dev workflow

| # | Rule | Src |
|---|---|---|
| 13.1 | **Plan first, verify the plan, track progress.** Write the plan to `tasks/todo.md` with checkable items; check in before implementing; mark items off as you go. | **[M]** |
| 13.2 | **Plan mode is the default for anything non-trivial** (3+ steps or an architectural decision). If it goes sideways, STOP and re-plan — don't keep pushing. | **[M]** |
| 13.3 | **Use subagents liberally.** Keep the main context clean; offload research and parallel analysis; one tack per subagent. | **[M]** |
| 13.4 | **Autonomous bug fixing.** Given a bug report: fix it. Point at the logs, errors and failing tests, then resolve them. *(Tension with §2.2 — see §14.1.)* | **[M]** |
| 13.5 | **SIRENS — five-middleware ethics/scope supervisor** on multi-agent security systems. Ethical guards, not just technical ones. | **[M]** |
| 13.6 | **Every project ships the standard doc set:** CLAUDE.md, DESIGN.md, AGENT.md, SOUL.md. | **[M]** |
| 13.7 | **SEO / AEO / GEO is a build requirement, not a marketing afterthought.** | **[R]** |

## 14. Conflicts — resolve these

Genuine disagreements between the two registers. Nothing has been silently resolved.

**14.1 — Default autonomy posture.** §2.1 (four human gates, agents own routine execution by
default) and §13.4 (autonomous bug fixing, don't ask for hand-holding) sit against §2.2 (nothing at
all happens on the naked-app without explicit approval). Likely resolution: the naked-app is a
stricter regime because it's Cory's live software and not ours — the four-gates default applies
everywhere else. **That needs stating explicitly, because right now an agent reading both files
gets contradictory instructions.**

**14.2 — Dependency floor.** §7.1 (stdlib only, no pip dependencies) is a skill-pack rule that
can't hold for full-stack products. §7.8 and §3.8 are the general rules. State the scope of §7.1 so
it isn't read as fleet-wide.

**14.3 — n8n.** §12.7 says n8n is for client deployments only, internal fleet on Hermes. But
`MAESTRO_MISSION_BRIEF.md` Mission 3 is full two-way n8n wiring. If Maestro/LRRecords counts as a
client deployment there's no conflict — worth confirming.

**14.4 — Design system scope.** §11.1 (every product gets its own) and §11.9 (brand green `#7EFF00`)
apply to different layers — DefPirate's system versus the fleet's. Fine as-is, but note which layer
a new build inherits from.

## 15. Still unwritten anywhere

Everything in §1.1, §1.2 and all `[M]` rules exist only in claude.ai memory and this file. They are
not in any repo, no agent reads them at runtime, and no gate enforces them. **The next move is
promoting the ones that should bind agents into `CLAUDE.md` and the pre-merge gate script (§3.9).**

---

*Merged 23 Aug 2026 from the repo register (`1Deaf-Pirate` + `naked-app-muso-skills`) and
The Rules — Fruit Empire Operating Bible. When a rule changes, change it here and in its source —
one source of truth (§1.5).*
