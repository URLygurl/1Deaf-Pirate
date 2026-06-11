#!/usr/bin/env bash
# wire-orchestration.sh
# Turns the squad from "15 profiles that exist" into "15 profiles DIME can
# actually dispatch work to." This is the connective tissue — the Kanban board
# + the orchestrator wiring + the dispatcher.
#
# How it works once wired (straight from the Hermes docs):
#   • Kanban is a durable board shared across all profiles (~/.hermes/kanban.db).
#   • DIME is the orchestrator_profile: a rough task dropped in TRIAGE gets
#     auto-decomposed — DIME reads it, looks at the roster (by description),
#     and fans it out into child cards routed to the best-fit specialists.
#   • The dispatcher (runs INSIDE the gateway) spawns each assignee as a real
#     process — `hermes -p eddie chat -q …` — with the kanban_* tools wired in.
#   • Each worker does its job and calls kanban_complete / kanban_block.
#   • DIME wakes back up to judge completion and gives Vanessa one answer.
#
# Run on the box AFTER bring-up-squad.sh + assign-skills.sh:
#     git pull && bash scripts/wire-orchestration.sh
#
# Safe to re-run. Add --smoke to also drop a test card and confirm dispatch.

set -uo pipefail
REPO="$(cd "$(dirname "$0")/.." && pwd)"
HERMES="${HERMES_HOME:-$HOME/.hermes}"
ORCH="dime"

say() { printf '\n\033[1m%s\033[0m\n' "$1"; }

# ── 0. sanity: is hermes here, does DIME exist? ───────────────────────────────
command -v hermes >/dev/null 2>&1 || {
  echo "✗ 'hermes' not on PATH. Run:  export PATH=\"\$HOME/.local/bin:\$PATH\""
  echo "  (then re-run this script). Hermes must be installed first."
  exit 1
}
if ! hermes profile list 2>/dev/null | grep -qiw "$ORCH"; then
  echo "✗ no '$ORCH' profile yet. Run bring-up-squad.sh first, then this."
  exit 1
fi

# ── 1. the board ──────────────────────────────────────────────────────────────
say "1/5  Initialising the Kanban board"
hermes kanban init 2>/dev/null && echo "   ✓ board ready (~/.hermes/kanban.db)" \
  || echo "   ✓ board already initialised"

# ── 2. make DIME the orchestrator ─────────────────────────────────────────────
say "2/5  Wiring DIME as the orchestrator"
# orchestrator_profile = who owns a triage task + wakes to judge completion.
# auto_decompose       = drop a rough idea in triage → DIME fans it out.
# dispatch_in_gateway  = the dispatcher rides inside the gateway (default).
# auto_promote_children= a child card auto-readies when its parents finish.
set_cfg() {
  hermes config set "$1" "$2" >/dev/null 2>&1 \
    && printf '   ✓ %-32s = %s\n' "$1" "$2" \
    || printf '   ! could not set %s (set it via: hermes config edit)\n' "$1"
}
set_cfg kanban.orchestrator_profile "$ORCH"
set_cfg kanban.auto_decompose       true
set_cfg kanban.dispatch_in_gateway  true
set_cfg kanban.auto_promote_children true

# ── 3. give DIME the kanban toolset + his orchestrate skill ───────────────────
say "3/5  Enabling DIME's routing tools + syncing his orchestrate skill"
# Workers get kanban_* auto-injected when spawned; an ORCHESTRATOR profile must
# enable the broader `kanban` toolset explicitly so DIME can create/link/list.
hermes -p "$ORCH" tools enable kanban >/dev/null 2>&1 \
  && echo "   ✓ kanban toolset on for $ORCH" \
  || echo "   ! enable manually:  hermes -p $ORCH tools enable kanban"
# delegation = his quick-think tool (delegate_task) for reasoning before routing.
hermes -p "$ORCH" tools enable delegation >/dev/null 2>&1 \
  && echo "   ✓ delegation toolset on (for quick pre-routing thinks)"

# Re-sync DIME's squad-layer orchestrate skill into the live profile dir.
src="$REPO/agents/open/DIME/skills"; pdir="$HERMES/profiles/$ORCH/skills"
if [ -d "$src" ]; then
  mkdir -p "$pdir" && cp -r "$src/." "$pdir/" \
    && echo "   ✓ orchestrate skill synced → $pdir"
fi

# Route-don't-execute discipline is carried by DIME's orchestrate SKILL.md + the
# two locks — not by stripping his tools (he still talks to Vanessa directly).
# For STRICT separation (orchestrator can't implement), uncomment:
# for t in terminal file code_execution; do hermes -p "$ORCH" tools disable "$t" >/dev/null 2>&1; done

# ── 4. the dispatcher (lives in the gateway) ──────────────────────────────────
say "4/5  The dispatcher"
echo "   The dispatcher runs INSIDE the gateway. Ready cards only get picked up"
echo "   while the gateway is running. Start it in its OWN tmux window so it"
echo "   stays up (it's long-lived — don't run it inline here):"
echo
echo "       tmux new -s gateway   # then, inside:"
echo "       export PATH=\"\$HOME/.local/bin:\$PATH\""
echo "       hermes gateway start"
echo
echo "   Detach with Ctrl-b then d. The board sweeps every ~60s while it's up."

# ── 5. summary / smoke test ───────────────────────────────────────────────────
say "5/5  Status"
hermes kanban stats 2>/dev/null || echo "   (stats unavailable — board may be empty, that's fine)"

if [ "${1:-}" = "--smoke" ]; then
  say "Smoke test — dropping a triage card for DIME to decompose"
  echo "   (needs the gateway running to actually dispatch)"
  hermes kanban create "smoke test: confirm DIME can route a tiny task" \
    --assignee "$ORCH" 2>&1 | sed 's/^/   /'
  echo
  echo "   Watch it:   hermes kanban watch     (or:  hermes kanban list)"
  echo "   Archive when done:  hermes kanban list  → grab the id →  hermes kanban archive <id>"
fi

cat <<'DONE'

════════════════════════════════════════════════════════
Wired. DIME is the orchestrator; the board is live.

Drive it three ways:
  • Talk to DIME:        dime chat        ("plan the single launch and …")
  • Drop a rough idea:   hermes kanban create "…"   → lands in triage → DIME fans out
  • Watch the work:      hermes kanban watch    /    hermes kanban list

Remember the locks: cascades PREPARE instantly; any real-world action
(send / post / pay / book / contact / deploy) holds at the action-lock.
DONE
