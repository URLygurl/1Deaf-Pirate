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
- **Memory / brains** — *dual-strain, by purpose* (Hermes allows one external
  provider live at a time, so "dual" = a custom dual-write provider):
  - **Honcho** — primary squad brain (multi-agent: shared workspace + per-profile
    AI peer = the HIVE). Live provider.
  - **Hindsight** — second strain: knowledge-graph + `reflect` synthesis (relationship
    reasoning), via a **dual-write memory provider** we build so both populate.
  - **Obsidian (Claude ↔ Obsidian)** — third brain: the user's file/notes "second
    brain" for file management (a shared vault, not an LLM memory provider).
  - **HIVE + git** — always-on, version-controlled redundancy (the `hive-loop` hooks).
  - Built-in `MEMORY.md`/`USER.md` stays on beneath all of it.
- **Routing/intent** — each profile's `description` is the routing key, derived from
  its skills (`hermes profile describe --auto`); peer-reviewed, de-conflicted by DIME.
  See `docs/intent-authoring.md`.
- **Hosting roadmap** — **Lightning AI** (cloud GPU) is the *proving ground*: one
  Studio runs the Hermes host + 15 profiles + Kanban + self-hosted brains, with
  LitServe/vLLM serving local inference. **Eventual home: 2× on-prem inference
  boxes** (owned hardware → physical failsafes return; 2 = hardware redundancy).
  Build stays **portable** (profiles as git distributions + self-hosted brains +
  HIVE in git) so the move is a redeploy, not a rebuild. **Supply-chain step:** vet
  the boxes (firmware/BIOS, isolate + watch egress) before the squad moves in.
  Plain-English version: `docs/roadmap.md`.

## Open questions / parked
- Railway MCP auth — needs a project-scoped `RAILWAY_API_TOKEN` (parked).
- Sequencing: launch on Honcho live first; **dual-write (Honcho+Hindsight)** as a
  fast-follow build so it doesn't block the first squad test.
- Exact Claude↔Obsidian integration shape (shared `dir:` vault vs dedicated skill) —
  verify when wiring file management.
