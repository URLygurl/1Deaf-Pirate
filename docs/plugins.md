# Plugins — Build Plan

How the Deadsound squad maps onto the **Hermes plugin system**
([docs](https://hermes-agent.nousresearch.com/docs/user-guide/features/plugins)).

Most of our architecture maps onto plugin extension points almost 1:1 — the plugin
layer is how the HIVE, the reveal gate, and Hermes routing actually get implemented.
The question isn't *whether* to use plugins, it's *which* pillars become plugins vs.
config vs. core.

## How plugins fit our stack

A Hermes plugin is a directory with a `plugin.yaml` + `register(ctx)`. Inside
`register`, `ctx.*` exposes the extension points we need:

- `ctx.register_tool(...)` — a tool the LLM can call
- `ctx.register_hook("post_tool_call", cb)` — lifecycle hooks (the HIVE loop)
- `ctx.register_command(...)` / `ctx.dispatch_tool(...)` — slash commands + routing
- `ctx.register_skill(...)` — bundle an agent's SOUL/SKILLS as `plugin:skill`
- `ctx.register_platform(...)` — gateway channels (NEIL's front door)
- `MemoryProvider` subclass — the HIVE backend (single active provider)

Discovery precedence (later wins): bundled `plugins/` → user `~/.hermes/plugins/` →
project `.hermes/plugins/` → pip entry-points → Nix. Our plugins ship **bundled** in
this repo's `plugins/` (this repo *is* the Hermes control plane → Railway `/hermes`).

**Opt-in = our HITL gate.** General plugins don't load until added to
`plugins.enabled` in `~/.hermes/config.yaml`; project plugins also need
`HERMES_ENABLE_PROJECT_PLUGINS=true`. That allow-list lines up with our staged
reveal / double-HITL rule (`docs/architecture.md`) — nothing runs without explicit
consent.

## The build list

### Tier 1 — keystone (build first)

| Plugin | Type | What it does | Maps to |
|---|---|---|---|
| **`hive-loop`** ✅ | hooks + tools | The 6-stage operating map as `post_tool_call` / `pre_llm_call` / `pre_tool_call` hooks + `hive_rule` / `source_check` tools, on local `hive/` files | `operating-map.md`, build step 2 |
| **`hive`** | memory provider | The shared-brain *backend* (`plugins/memory/hive/`, subclass `MemoryProvider`, one active). Resolves the parked Honcho/Mem0/Hindsight decision | `architecture.md` parked decision |

### Tier 2 — Hermes itself

| Plugin | Type | What it does | Maps to |
|---|---|---|---|
| **`hermes-router`** | command + dispatch | DIME's routing table: `register_command("route")` + `ctx.dispatch_tool()` fans work to specialists and synthesizes back | DIME `agent.json`, build step 3 |
| **`reveal-gate`** ✅ | `pre_tool_call` hook | Refuses to dispatch any agent not `status: live`; enforces `hitl_locks` via the reveal ledger | double-HITL reveal rule |

### Tier 3 — specialists & front door

| Plugin | Type | What it does | Maps to |
|---|---|---|---|
| **agent-as-plugin** | skill (+ tool when closed) | Each specialist `register_skill()`s its SOUL/SKILLS; once *closed* it also `register_tool()`s its scoped op. Open = skill only; closed = skill + locked tool | `graduation-path.md` |
| **`naked-gateway`** | platform | NEIL's first-contact channel — Discord/Telegram now, NakedApp dash adapter later | NEIL `agent.json`, `architecture.md` |

## Explicitly NOT plugins

- **Connectors** (Slack / Notion / GitHub / HubSpot) → **MCP servers via config**
  (`mcp_servers.<name>` in `config.yaml`). Hermes auto-registers their tools.
- **Model provider** → Anthropic is a bundled provider; pick it in `config.yaml`.
- **Railway deploy** → lives in `infra/`, stays out of the plugin layer.

## Status

- [x] `hive-loop` — scaffolded in `plugins/hive-loop/`
- [x] `reveal-gate` — scaffolded in `plugins/reveal-gate/`
- [ ] `hive` memory provider
- [ ] `hermes-router`
- [ ] agent-as-plugin reference (NEIL or DIME)
- [ ] `naked-gateway` platform adapter
