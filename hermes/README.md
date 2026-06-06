# Hermes — The Orchestrator

> *The layer that knows you, knows your workflows, and knows which specialist to call.*

Hermes is the command center. You ask → **Hermes routes** → a specialist executes → the specialist reports back → Hermes synthesizes. Hermes does **not** do the work itself; it dispatches and assembles.

## When Hermes routes
- the work touches multiple specialists
- you don't know which one owns it
- ownership is unclear
- you want one synthesis at the end

## What lives in the Hermes system (shared by all agents)

| Folder | Holds |
|---|---|
| `orchestrator/` | routing logic — who owns what, how requests fan out and synthesize |
| `identity/` | identity & config for Hermes itself |
| `sessions/` | sessions & memory (bridges to `hive/`) |
| `tools/` | tools & connectors registry |
| `frameworks/` | skills & frameworks shared across agents |
| `backlog/` | backlogs & cron (what closed specialists run on) |
| `observability/` | logs & observability — every call, every handoff |

## Deploy
Control plane runs at **`/hermes` on Railway** (`../infra/railway/`). The `hermes-agent`
container brain talks to the **NakedApp** dash where intros happen.
