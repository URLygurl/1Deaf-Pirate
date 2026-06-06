# reveal-gate

Staged reveal / double-HITL, enforced at runtime. The house rule
("nothing goes live without double-HITL sign-off", `docs/architecture.md`) becomes
a `pre_tool_call` hook that blocks dispatch to any specialist that isn't cleared.

## What it does

- Reads every `agents/{open,closed}/*/agent.json` for `name` + `status`.
- On each tool call, works out whether the call targets an agent (tool name/toolset
  matches an agent, or an agent name appears under `agent` / `target` / `specialist`
  / `to` / `owner` in the call args).
- **Blocks** anything aimed at an agent that isn't `status: live`:
  `{"action": "block", "message": "...not live. Double-HITL sign-off required..."}`.
- `reveal_status` tool — lists who can take work right now.

DIME + NEIL reveal first; until an agent is flipped to `live` it stays blocked.

## Reveal ledger (optional)

`hive/4-permissions/reveal-ledger.json`:

```json
{ "DIME": { "confirmed": 2 }, "NEIL": { "confirmed": 2 } }
```

If an agent is listed, `confirmed` must be ≥ its `hitl_locks` even when
`status: live` — so a status flipped without the two sign-offs is still blocked.

## Config

- `REVEAL_AGENT_ARG_KEYS` — comma-separated arg keys to scan for an agent name
  (default `agent,target,specialist,to,owner`).

## Install

```bash
hermes plugins enable reveal-gate
```

Pairs with `hive-loop`: hive-loop's `pre_tool_call` gate handles per-tool
permissions; reveal-gate's handles per-agent reveal state. Both can run together —
either blocking veto wins.

Hook contract confirmed against the
[Event Hooks reference](https://hermes-agent.nousresearch.com/docs/user-guide/features/hooks#plugin-hooks):
`pre_tool_call(tool_name, args, task_id, **kwargs)` → `{"action":"block","message":str}`.
