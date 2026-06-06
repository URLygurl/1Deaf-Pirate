"""hive-loop — the HIVE operating map, wired into Hermes as hooks + tools.

The shared brain (`hive/`) runs one loop:

    1-capture → 2-retrieval → 3-source-truth → 4-permissions → 5-feedback-loops → 6-execution
                                     ▲                                  │
                                     └──────────  corrections  ─────────┘

This plugin makes that loop *run* instead of just describing it:

    Capture      post_tool_call   → append work to hive/1-capture/log.jsonl
    Retrieval    pre_llm_call     → inject active rules + source-truth into the turn
    Permissions  pre_tool_call    → deny tools blocked by hive/4-permissions/deny.txt
    Feedback     hive_rule tool   → turn a correction into a rule (hive/5-feedback-loops/)
    Source-Truth source_check     → record/answer "what's true now"

No external memory backend is required — everything reads/writes local hive/ files, so
the Honcho/Mem0/Hindsight decision (architecture.md, parked) can stay parked while the
loop is live.

Hook signatures (confirmed against the Event Hooks reference) — Hermes invokes
hooks with keyword arguments, so callbacks bind by name and ignore the rest via
`**kwargs`:

    post_tool_call(tool_name, result, duration_ms=0, **kwargs)   # return ignored
    pre_tool_call(tool_name, args, task_id, **kwargs)            # {"action":"block","message":str} to veto
    pre_llm_call(session_id, user_message, is_first_turn, **kwargs)  # {"context":str} to inject

https://hermes-agent.nousresearch.com/docs/user-guide/features/hooks#plugin-hooks
"""

from __future__ import annotations

import json
import os
import time
from pathlib import Path


def _hive_root() -> Path:
    """Resolve the brain root: $HIVE_ROOT, else <repo>/hive."""
    env = os.environ.get("HIVE_ROOT")
    if env:
        return Path(env).expanduser()
    # plugins/hive-loop/__init__.py → parents[2] == repo root
    return Path(__file__).resolve().parents[2] / "hive"


def _append_jsonl(path: Path, record: dict) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("a", encoding="utf-8") as fh:
        fh.write(json.dumps(record, ensure_ascii=False) + "\n")


def _read_lines(path: Path, limit: int = 20) -> list[str]:
    if not path.exists():
        return []
    lines = [ln.strip() for ln in path.read_text(encoding="utf-8").splitlines()]
    lines = [ln for ln in lines if ln and not ln.startswith("#")]
    return lines[-limit:]


def register(ctx):
    hive = _hive_root()
    capture_log = hive / "1-capture" / "log.jsonl"
    rules_file = hive / "5-feedback-loops" / "rules.md"
    truth_file = hive / "3-source-truth" / "facts.md"
    deny_file = hive / "4-permissions" / "deny.txt"

    # ----- Capture: every tool call lands in the brain ------------------------
    # post_tool_call(tool_name, result, duration_ms=0, **kwargs) — invoked by
    # keyword, so tool input may arrive as `args` or `params`. Return is ignored.
    def capture(tool_name, result=None, **kwargs):
        tool_input = kwargs.get("args", kwargs.get("params"))
        _append_jsonl(
            capture_log,
            {
                "ts": time.time(),
                "stage": "capture",
                "tool": tool_name,
                "input": tool_input,
                "ok": _looks_ok(result),
            },
        )

    ctx.register_hook("post_tool_call", capture)

    # ----- Retrieval: inject active rules + source-truth into the turn --------
    # pre_llm_call(session_id, user_message, is_first_turn, **kwargs).
    # Return {"context": str} to prepend context to the user message.
    def retrieve(**kwargs):
        del kwargs
        rules = _read_lines(rules_file, limit=15)
        facts = _read_lines(truth_file, limit=15)
        if not rules and not facts:
            return None
        chunks = ["[HIVE] active context — what the squad has already learned:"]
        if facts:
            chunks.append("Source truth:\n" + "\n".join(f"- {f}" for f in facts))
        if rules:
            chunks.append("Rules from past corrections:\n" + "\n".join(f"- {r}" for r in rules))
        return {"context": "\n\n".join(chunks)}

    ctx.register_hook("pre_llm_call", retrieve)

    # ----- Permissions: a tool listed in deny.txt never runs ------------------
    # pre_tool_call(tool_name, args, task_id, **kwargs). Return
    # {"action": "block", "message": str} to veto before the approval system.
    def gate(tool_name=None, **kwargs):
        del kwargs
        denied = set(_read_lines(deny_file, limit=1000))
        if tool_name and tool_name in denied:
            return {
                "action": "block",
                "message": f"hive/4-permissions: '{tool_name}' is blocked. "
                "One big brain with no walls is dangerous.",
            }
        return None

    ctx.register_hook("pre_tool_call", gate)

    # ----- Feedback: a correction becomes a rule ------------------------------
    rule_schema = {
        "name": "hive_rule",
        "description": (
            "Record a correction as a permanent rule in the HIVE. Use when the user "
            "corrects a mistake so the same mistake never repeats. Every correction "
            "becomes a rule the whole squad reads next time."
        ),
        "parameters": {
            "type": "object",
            "properties": {
                "rule": {
                    "type": "string",
                    "description": "The rule, stated imperatively. e.g. 'Always cite the source file for code claims.'",
                },
                "context": {
                    "type": "string",
                    "description": "Optional: what prompted it (the mistake being corrected).",
                },
            },
            "required": ["rule"],
        },
    }

    def handle_rule(params, **kwargs):
        del kwargs
        rule = (params.get("rule") or "").strip()
        if not rule:
            return json.dumps({"success": False, "error": "rule is required"})
        rules_file.parent.mkdir(parents=True, exist_ok=True)
        line = f"- {rule}"
        if params.get("context"):
            line += f"  _(from: {params['context'].strip()})_"
        with rules_file.open("a", encoding="utf-8") as fh:
            fh.write(line + "\n")
        return json.dumps({"success": True, "rule": rule, "written_to": str(rules_file)})

    ctx.register_tool(
        name="hive_rule",
        toolset="hive",
        schema=rule_schema,
        handler=handle_rule,
        description="Turn a correction into a permanent HIVE rule.",
    )

    # ----- Source-Truth: record / answer 'what's true now' --------------------
    truth_schema = {
        "name": "source_check",
        "description": (
            "Record a verified fact as source-of-truth, or list current facts. "
            "Source truth prevents confident lies — prefer it over guessing."
        ),
        "parameters": {
            "type": "object",
            "properties": {
                "fact": {
                    "type": "string",
                    "description": "A verified fact to record. Omit to just list current facts.",
                },
                "source": {
                    "type": "string",
                    "description": "Where it came from (file, call, CRM, person).",
                },
            },
        },
    }

    def handle_truth(params, **kwargs):
        del kwargs
        fact = (params.get("fact") or "").strip()
        if not fact:
            return json.dumps({"success": True, "facts": _read_lines(truth_file, limit=50)})
        truth_file.parent.mkdir(parents=True, exist_ok=True)
        line = f"- {fact}"
        if params.get("source"):
            line += f"  _(source: {params['source'].strip()})_"
        with truth_file.open("a", encoding="utf-8") as fh:
            fh.write(line + "\n")
        return json.dumps({"success": True, "fact": fact, "written_to": str(truth_file)})

    ctx.register_tool(
        name="source_check",
        toolset="hive",
        schema=truth_schema,
        handler=handle_truth,
        description="Record or list HIVE source-of-truth facts.",
    )


def _looks_ok(result) -> bool:
    """Best-effort: did the tool return a success-shaped payload?"""
    if result is None:
        return True
    try:
        if isinstance(result, str):
            result = json.loads(result)
        if isinstance(result, dict) and "success" in result:
            return bool(result["success"])
    except (ValueError, TypeError):
        pass
    return True
