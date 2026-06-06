"""reveal-gate — staged reveal / double-HITL enforcement, as a pre_tool_call hook.

House rule (docs/architecture.md): "nothing goes live without double-HITL sign-off."
This plugin makes that runtime-enforceable. It reads every specialist's
`agent.json` and refuses to dispatch work to any agent that isn't `status: live`
with its `hitl_locks` satisfied. DIME + NEIL reveal first; everyone else stays
blocked until a human flips them.

An agent is considered targeted by a tool call when:
  - the tool's name or toolset equals an agent name, OR
  - the call's args carry an agent name under one of AGENT_ARG_KEYS
    (default: agent, target, specialist, to, owner).

When targeted and not cleared, the call is vetoed via the confirmed pre_tool_call
contract:  return {"action": "block", "message": str}.

Reveal ledger (optional): hive/4-permissions/reveal-ledger.json
    {"DIME": {"confirmed": 2}, "NEIL": {"confirmed": 2}}
If an agent appears in the ledger, `confirmed` must be >= its `hitl_locks` even
when status is "live" — defense against a status flipped without sign-off.

Signature confirmed against the Event Hooks reference:
    pre_tool_call(tool_name, args, task_id, **kwargs)
"""

from __future__ import annotations

import json
import os
from pathlib import Path

_DEFAULT_ARG_KEYS = ("agent", "target", "specialist", "to", "owner")


def _repo_root() -> Path:
    return Path(__file__).resolve().parents[2]


def _arg_keys() -> tuple[str, ...]:
    raw = os.environ.get("REVEAL_AGENT_ARG_KEYS")
    if raw:
        return tuple(k.strip() for k in raw.split(",") if k.strip())
    return _DEFAULT_ARG_KEYS


def _load_agents(root: Path) -> dict[str, dict]:
    """name(lower) -> {name, status, hitl_locks} from agents/{open,closed}/*/agent.json."""
    agents: dict[str, dict] = {}
    for cfg in root.glob("agents/*/*/agent.json"):
        if "_template" in cfg.parts:
            continue
        try:
            data = json.loads(cfg.read_text(encoding="utf-8"))
        except (ValueError, OSError):
            continue
        name = str(data.get("name", "")).strip()
        if not name or name == "AGENT_NAME":
            continue
        agents[name.lower()] = {
            "name": name,
            "status": str(data.get("status", "parked")).lower(),
            # hitl_locks may live in agent.config.yaml; agent.json default is 2.
            "hitl_locks": int(data.get("hitl_locks", 2)),
        }
    return agents


def _load_ledger(root: Path) -> dict[str, dict]:
    path = root / "hive" / "4-permissions" / "reveal-ledger.json"
    if not path.exists():
        return {}
    try:
        return {k.lower(): v for k, v in json.loads(path.read_text(encoding="utf-8")).items()}
    except (ValueError, OSError):
        return {}


def _targeted_agent(tool_name, args, agents: dict[str, dict]) -> str | None:
    """Which agent (lower key) is this call aimed at, if any."""
    if tool_name and tool_name.lower() in agents:
        return tool_name.lower()
    if isinstance(args, dict):
        for key in _arg_keys():
            val = args.get(key)
            if isinstance(val, str) and val.lower() in agents:
                return val.lower()
    return None


def _blocked_reason(agent: dict, ledger: dict[str, dict]) -> str | None:
    """Return a block message if the agent isn't cleared to receive work, else None."""
    if agent["status"] != "live":
        return (
            f"reveal-gate: '{agent['name']}' is status:{agent['status']}, not live. "
            f"Double-HITL sign-off required before it can take work."
        )
    entry = ledger.get(agent["name"].lower())
    if entry is not None:
        confirmed = int(entry.get("confirmed", 0))
        if confirmed < agent["hitl_locks"]:
            return (
                f"reveal-gate: '{agent['name']}' is live but only {confirmed}/"
                f"{agent['hitl_locks']} HITL locks are confirmed in the reveal ledger."
            )
    return None


def register(ctx):
    root = _repo_root()

    def gate(tool_name=None, args=None, **kwargs):
        del kwargs
        agents = _load_agents(root)
        if not agents:
            return None
        key = _targeted_agent(tool_name, args, agents)
        if key is None:
            return None  # not an agent dispatch — not our concern
        reason = _blocked_reason(agents[key], _load_ledger(root))
        if reason:
            return {"action": "block", "message": reason}
        return None

    ctx.register_hook("pre_tool_call", gate)

    # Read-only: show who's cleared and who's blocked.
    status_schema = {
        "name": "reveal_status",
        "description": (
            "List every specialist's reveal state (parked/staged/live) and whether "
            "double-HITL locks are satisfied. Use to see who can take work right now."
        ),
        "parameters": {"type": "object", "properties": {}},
    }

    def handle_status(params, **kwargs):
        del params, kwargs
        agents = _load_agents(root)
        ledger = _load_ledger(root)
        out = []
        for info in sorted(agents.values(), key=lambda a: a["name"]):
            blocked = _blocked_reason(info, ledger)
            out.append(
                {
                    "name": info["name"],
                    "status": info["status"],
                    "hitl_locks": info["hitl_locks"],
                    "confirmed": int(ledger.get(info["name"].lower(), {}).get("confirmed", 0)),
                    "can_take_work": blocked is None,
                }
            )
        return json.dumps({"success": True, "agents": out})

    ctx.register_tool(
        name="reveal_status",
        toolset="reveal",
        schema=status_schema,
        handler=handle_status,
        description="Show each specialist's staged-reveal / HITL state.",
    )
