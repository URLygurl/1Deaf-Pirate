# 1Deaf-Pirate 🏴‍☠️

**The DefPirate / Deadsound agent platform** — a 15-agent swarm orchestrated by **Hermes**, backed by a shared **HIVE** memory ("what one learns, all learn"), wrapped in a fully fleshed-out rock-legend world build.

> Memory is raw material. Retrieval is the operating layer.

## What this repo is

This is the **source of truth** for the platform: planning, scoping, research, world-build, agent definitions, and the wiring that stands the agents up before we click **GO** on the new Hermes platform. It is a complete, reloadable record — if a machine dies, the whole project (and the shared memory of it) survives here.

## The shape

| Folder | What lives here |
|---|---|
| `hermes/` | **The orchestrator** — the command center that knows you, your workflows, and routes work to the right specialist. |
| `agents/` | **The 15 agents** — `open/` (chat, dynamic, exploration) and `closed/` (cron, repeatable, scoped). |
| `hive/` | **The Company Brain** — Capture → Retrieval → Source-Truth → Permissions → Feedback → Execution. |
| `world/` | **The world build** — lore, rock-legend personas, brand (`#7EFF00`), voice. |
| `platform/` | The app wiring (api, services, components). |
| `infra/` | Deployment — Railway control plane (`/hermes`), docker. |
| `.claude/` | Claude Code workspace — settings, commands, skills, agents, plugins, MCP. |
| `docs/` | Architecture & the canon docs (open-vs-closed, graduation path, operating map). |
| `scripts/` | Operations — including `backup.sh` so the work is never lost again. |

## Cast

- **DIME** — Hermes / the orchestrator (the command center)
- **NEIL** — front-of-house / greeter (first reveal, says hi for Coryt)
- …+ 13 rock-legend specialists — see [`agents/ROSTER.md`](agents/ROSTER.md)

## Status

🚧 Scaffold. Pre-GO. See [`docs/architecture.md`](docs/architecture.md) for the build plan.
