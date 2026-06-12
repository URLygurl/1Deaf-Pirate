# agent-control-room

> The **sidecar that governs the fleet.** Not the agents themselves — the *map,
> manual, registry, runbooks, and recovery notebook* for running and scaling them.
> When something breaks at 2am, you open this folder, not a month of old chats.

This exists so the squad is **operable, recoverable, and cloneable** — instead of
living in one person's head. It's also a **template**: copy this whole folder for
the next crew, swap the map + registry, reuse the manual + runbooks.

## The five parts

| File | Is | Answers |
|---|---|---|
| [`01-system-map.md`](01-system-map.md) | **System map** | *What's running, where, and how it connects?* |
| [`02-op-manual.md`](02-op-manual.md) | **Op manual** | *How do I run it day-to-day?* |
| [`03-registry.md`](03-registry.md) | **Registry** | *Who are the agents, what's their status?* |
| [`04-runbooks.md`](04-runbooks.md) | **Runbook library** | *Step-by-step for a specific job/incident.* |
| [`05-recovery.md`](05-recovery.md) | **Recovery notebook** | *It broke / I want to rebuild clean — now what?* |

## How to use it
- **Keep it current.** Every new procedure → a runbook. Every incident/fix → a note
  in recovery. Every agent change → the registry. Stale control room = no control.
- **It's the operator's START-HERE.** New session or cold return: read the map +
  registry, you're oriented.

## Rules
- 🔒 **No secrets here.** Ever. Keys, passwords, the 1Panel security-entrance path,
  bot tokens → `.env` / the DO panel only, never committed. This folder is git.
- 📍 **One source of truth.** If it contradicts the live box, fix the doc.

## To scale (clone the next squad)
Copy `agent-control-room/` → new repo. Rewrite `01` (map) + `03` (registry) for the
new crew. `02` (manual) + `04` (runbooks) + `05` (recovery) are mostly reusable —
that's the whole point of a template.
