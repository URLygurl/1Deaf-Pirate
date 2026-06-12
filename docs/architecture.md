# Architecture & Build Plan

## The stack
- **Hermes** (orchestrator) routes work to specialists and synthesizes results.
- **15 agents** — open (interactive) + closed (operational), each built from `agents/_template/`.
- **HIVE** — shared memory all agents read/write (`hive/`), following the operating-map loop.
- **World build** — lore, personas, brand, voice (`world/`).
- **Platform** — app wiring (`platform/`), deployed via **Railway** (`infra/`).

## How a request flows
```
You → Hermes (route) → Specialist (open chat OR closed run) → HIVE (capture + correct) → Hermes (synthesize) → You
```

## Build order (pre-GO)
1. **Scaffold** ✅ — this repo.
2. **Lock the HIVE** — wire shared memory (Capture→…→Execution). "What one learns, all learn."
3. **Stand up Hermes** — orchestrator + routing + observability on Railway `/hermes`.
4. **Build agents from template** — fill SOUL/SKILLS per ClickUp roster + Peachy Dossier exports.
5. **Reveal slowly** — DIME + NEIL first, double-HITL locks before any agent goes live.
6. **Graduate** open specialists → closed as workflows stabilise.

## Reveal & safety
- Staged reveal; nothing goes live without **double-HITL** sign-off.
- Permissions gate the shared brain (`hive/4-permissions/`).
- Secrets live in `.env` only — never committed.

## Decisions (logged)
- **Topology** — the squad is **15 Hermes profiles** (persistent named agents)
  collaborating over **one Kanban board**; DIME = `orchestrator_profile`.
  `delegate_task` is for in-character grunt parallelism. See `docs/squad-topology.md`.
- **Memory / brains** — *GBrain is the spine* (revised after the HIVE review — see
  `docs/hive-architecture.md`):
  - **GBrain** — primary HIVE brain: MIT, self-hosted, wired via **MCP** (native to
    Hermes), already runs on Hermes in production. Gives synthesis, a knowledge
    graph (venues/artists/contracts), **gap analysis**, overnight consolidation, and
    per-login permission scoping. Replaces the hand-rolled Redis/pub-sub L1 design.
  - **Hermes Kanban** — the event bus + peer channels (L2/L5) + durable audit.
  - **Honcho / Hindsight** — optional later additions (per-user modeling / extra
    graph reflection), NOT the spine.
  - **Obsidian (Claude ↔ Obsidian)** — the user's file/notes "second brain" for file
    management (a shared vault, not an LLM memory provider).
  - **HIVE + git** — always-on, version-controlled redundancy (the `hive-loop` hooks).
  - Built-in `MEMORY.md`/`USER.md` stays on beneath all of it.
  - ⚠️ GBrain is one person's project — vet it (`pre-launch-checklist.md`) before live.
- **Routing/intent** — each profile's `description` is the routing key, derived from
  its skills (`hermes profile describe --auto`); peer-reviewed, de-conflicted by DIME.
  See `docs/intent-authoring.md`.
- **Hosting roadmap** — a **DigitalOcean Droplet** (always-on cloud VM) is the
  *proving ground*: one box runs the Hermes host + 15 profiles + Kanban +
  self-hosted brains. The model is served by **Claude via the Anthropic API** — the
  current CPU Droplet does **not** do local GPU inference (that returns on owned
  hardware). **Eventual home: 2× on-prem inference boxes** (owned hardware →
  physical failsafes return; 2 = hardware redundancy). Build stays **portable**
  (profiles as git distributions + self-hosted brains + HIVE in git) so the move is
  a redeploy, not a rebuild. **Supply-chain step:** vet the boxes (firmware/BIOS,
  isolate + watch egress) before the squad moves in.
  *(History: started on Lightning AI — unstable — then moved to DigitalOcean.)*
  Plain-English version: `docs/roadmap.md`.

## Open questions / parked
- Railway MCP auth — needs a project-scoped `RAILWAY_API_TOKEN` (parked).
- Sequencing: launch on Honcho live first; **dual-write (Honcho+Hindsight)** as a
  fast-follow build so it doesn't block the first squad test.
- Exact Claude↔Obsidian integration shape (shared `dir:` vault vs dedicated skill) —
  verify when wiring file management.
