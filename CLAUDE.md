# CLAUDE.md — 1Deaf-Pirate

Project brain for Claude Code. Read this first.

## What we're building

A 15-agent platform ("the Deadsound squad / DefPirate") orchestrated by **Hermes**. Two kinds of agents:

- **Open specialists** — you chat, you steer, context grows. For exploration, brainstorming, judgment. (`agents/open/`)
- **Closed specialists** — they run, you get results. Scoped IO, repeatable, cron/backend. For production work. (`agents/closed/`)

Agents **graduate** open → closed once their shape is stable (see `docs/graduation-path.md`).

Hermes is the layer that knows the user, knows the workflows, and **routes** work to the right specialist. It does not do the work — it dispatches and synthesizes.

## The HIVE (shared memory)

All agents read/write a shared brain (`hive/`). "What one learns, all learn." The brain follows one loop: **Capture → Retrieval → Source-Truth → Permissions → Feedback → Execution** (`docs/operating-map.md`). Every correction becomes a rule. Source truth prevents confident lies.

## Conventions

- **Each agent** gets a folder under `agents/open|closed/<NAME>/` built from `agents/_template/` (SOUL.md = identity/voice, SKILLS.md = capabilities, `agent.config.yaml` = wiring, `tools.yaml` = allowed tools).
- **Secrets never get committed.** Railway tokens, API keys → `.env` (gitignored). Template lives in `.env.example`.
- **Reveal is staged.** Double-HITL locks before any agent goes live. DIME + NEIL reveal first.
- Brand green: `#7EFF00`.

## Where things deploy

- Control plane: `/hermes` on **Railway** (`infra/railway/`).
- The `hermes-agent` container brain talks to the **NakedApp** dash where intros happen.

## House rules

- Keep `CLAUDE.md` under ~500 lines; link out to `docs/` for detail.
- One source of truth. Decisions get logged. Feedback compounds.
