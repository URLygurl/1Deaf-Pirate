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

## Open questions / parked
- Railway MCP auth — needs a project-scoped `RAILWAY_API_TOKEN` (parked).
- Final names/legends for roster slots 05–15.
- Memory provider decision (Honcho / Mem0 / Hindsight) for the HIVE backend.
