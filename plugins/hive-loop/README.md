# hive-loop

The HIVE operating map (`docs/operating-map.md`) as a runnable Hermes plugin.
Each stage of the loop is a hook or tool wired to the shared brain under `hive/`.

| Stage | Mechanism | Writes / reads |
|---|---|---|
| **Capture** | `post_tool_call` hook | appends every tool call → `hive/1-capture/log.jsonl` |
| **Retrieval** | `pre_llm_call` hook | injects active rules + source-truth into the turn |
| **Source-Truth** | `source_check` tool | records / lists facts → `hive/3-source-truth/facts.md` |
| **Permissions** | `pre_tool_call` hook | denies tools listed in `hive/4-permissions/deny.txt` |
| **Feedback** | `hive_rule` tool | a correction becomes a rule → `hive/5-feedback-loops/rules.md` |

## Why files, not a backend (yet)

The Honcho / Mem0 / Hindsight memory-backend decision is **parked**
(`docs/architecture.md`). This plugin runs the loop on local `hive/` files so the
loop is live now; swapping in a real backend later is a separate `plugins/memory/`
provider plugin (see `docs/plugins.md`).

## Install

```bash
# bundled with this repo's Hermes control plane — enable it:
hermes plugins enable hive-loop
```

Project-local plugins are opt-in: general plugins load only when added to
`plugins.enabled` in `~/.hermes/config.yaml`, and `./.hermes/plugins/` needs
`HERMES_ENABLE_PROJECT_PLUGINS=true`. That allow-list doubles as our staged-reveal
HITL gate.

## Config

- `HIVE_ROOT` — override the brain root (defaults to `<repo>/hive`).

## Heads-up

`post_tool_call` uses the documented `(tool_name, params, result)` signature; the
other hooks accept `**kwargs` defensively. Confirm exact payloads against the
[Event Hooks reference](https://hermes-agent.nousresearch.com/docs/user-guide/features/hooks#plugin-hooks)
before locking this in for production.

Runtime brain content (`log.jsonl`, `facts.md`, `rules.md`, `deny.txt`) is
gitignored — it's generated, not source.
