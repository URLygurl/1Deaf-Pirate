# 02 · Op Manual

*Day-to-day operating commands. All run in the **terminal** (the box shell), not
inside a Hermes chat. If `hermes` isn't found: `export PATH="$HOME/.local/bin:$PATH"`.*

## Talk to the squad
```
dime chat                     # chat with the orchestrator
hermes -p <name> chat         # chat with a specific specialist (e.g. eddie, gene)
hermes profile list           # see all profiles
```

## Orchestration board (Kanban)
```
hermes kanban create "the task / goal"   # drop work → triage → DIME fans out
hermes kanban list                        # see all cards + status
hermes kanban watch                       # live view
```

## Gateway (the dispatcher host)
```
hermes gateway status                     # active/running?
hermes gateway start | --stop
journalctl --user -u hermes-gateway -f    # live logs
```
Installed as a **systemd user service** with linger → survives logout + reboot.

## Skills
```
hermes -p <name> skills list              # what a profile has
hermes skills browse                      # the real installable catalogue
bash scripts/assign-skills.sh <name>      # batch-install a profile's optional skills
```
⚠️ **Gotcha:** each skill install **prompts `Confirm [y/N]`** after a security scan.
The batch script feeds `/dev/null`, so it can stall on that prompt. To actually see
the scan + confirm, install **manually, one at a time** (see runbook RB-03).

## Dashboard
```
hermes dashboard --status
hermes dashboard                          # builds + serves on 127.0.0.1:9119
hermes dashboard --stop
```

## Logs & health
```
hermes logs            # last agent log
hermes logs -f         # follow
hermes logs errors     # errors only
hermes update          # update Hermes
```

## tmux (the console multiplexer)
- New window: `Ctrl-b` then `c` · Switch: `Ctrl-b` then a number · Scroll: `Ctrl-b` then `[` (q to exit).

## The locks — never crossed
Build changes → wait for **Vanessa**. Real-world actions → wait for the **client**.
Prepare fully, hold at the line. "Drafted" ≠ "done."
