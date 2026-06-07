# Squad Topology — How the 15 Map onto Hermes

Verified against Hermes docs: [Profiles](https://hermes-agent.nousresearch.com/docs/user-guide/profiles),
[Kanban](https://hermes-agent.nousresearch.com/docs/user-guide/features/kanban),
[Subagent Delegation](https://hermes-agent.nousresearch.com/docs/user-guide/features/delegation).

## The headline

The squad is **not** one Hermes wearing 15 masks. It's **15 Hermes profiles —
persistent, named, independent agents** — collaborating over a shared **Kanban
board**. Your "15 Hermes collaborating" hunch is exactly the supported model.

## Three coordination primitives (we use all three)

| Primitive | What it is | Our use |
| --- | --- | --- |
| **Profiles** | Each agent is a separate Hermes home — own `SOUL.md`, skills, memory, model, `.env`, gateway identity, and a command alias (`lemmy chat`). A real, durable agent. | The 15 characters. DIME = the orchestrator profile. |
| **Kanban** | A durable SQLite task board shared across all profiles. **Peer model** — any profile reads/writes any task. Comments are the inter-agent protocol. Resumable, human-in-the-loop, full audit trail. | The squad's collaboration fabric — how work crosses agents. |
| **`delegate_task`** | Ephemeral, anonymous, fork→join subagents inside one profile's turn. | Within-character grunt parallelism (what generated the 80 skills). |

**Rule of thumb (from the docs):** `delegate_task` is a *function call*; Kanban is a
*work queue where every handoff is a row any profile or human can see and edit.*

## How routing works (DIME's job)

A Kanban task has one **assignee** (a profile name). Two modes:

- **Auto orchestration** — a decomposer LLM splits a goal into child tasks and
  assigns each to a profile **by its `description`**. Unknown/no match → falls back
  to `kanban.default_assignee`. `orchestrator_profile` owns the root task.
- **Manual orchestration** — a profile (DIME) creates/decomposes/assigns tasks
  explicitly with the `kanban_*` toolset.

Either way, **a worker can't grab work** — it's *assigned* a task and works it.
Land-grab stays structurally impossible; the board, not the worker, holds routing.

## Task lifecycle (the squad in motion)

```
triage → todo → ready → running → blocked → done → archived
                  ▲ dispatcher promotes when parent tasks are done
comments = inter-agent chatter + human input    links = dependencies
```

The **dispatcher** (runs inside the gateway) sweeps every ~60s: promotes ready
tasks, claims them, spawns the assigned profile, reclaims crashed workers,
auto-blocks after repeated spawn failures. Durable: a crash is reclaimed, not lost.

## How our pieces map

| Our concept | Hermes mechanism |
| --- | --- |
| A character (LEMMY, EDDIE…) | a **profile** (`agents/<name>/` → a profile distribution) |
| DIME / Hermes orchestrator | `orchestrator_profile` + auto-decompose (or manual `kanban_*`) |
| `pintent.md` (triggers/intent) | the profile **`description`** — the native routing key |
| Skills | the profile's `skills/` (what the description is derived from) |
| The HIVE (shared brain) | Kanban board (durable handoffs + audit) **+** shared memory workspace (Honcho multi-agent: shared workspace, per-profile identity) **+** `hive-loop` host hooks |
| Staged reveal / double-HITL | a profile isn't created/assignable until `live`; `reveal-gate` |
| "What one learns, all learn" | comments + shared memory workspace, readable by every profile |

## Why this is better than where we started

- Each character **persists and accumulates memory** (a "digital twin"), instead of
  being respawned blank each time.
- Collaboration is **durable and auditable** — every handoff is a row, survives
  restarts, allows you to comment/unblock mid-flight.
- It's **shippable** — each profile packages as a git distribution
  (`hermes profile install github.com/you/lemmy`). This repo becomes the squad.

## Build implication

When the account is up: stand up **15 profiles** (or install them as distributions
from this repo), give each its `SOUL.md` + `skills/` + a `description` derived from
its skills, point them at one Kanban board, and set DIME as `orchestrator_profile`.
Then test on the board.
