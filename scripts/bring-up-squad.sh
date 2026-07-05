#!/usr/bin/env bash
# bring-up-squad.sh
# Brings up the WHOLE squad as Hermes profiles — every agent in agents/open/.
# Each inherits your current Claude key+model (--clone) and loads its identity
# (soul.md) + the shared brain (brain.md, which now defines Vanessa).
#
# Run on the box, inside the cloned repo:
#     git pull && bash scripts/bring-up-squad.sh
#
# Re-running is safe: existing profiles keep their config, just refresh identity.
# Note: this makes each agent EXIST and KNOW you. Full orchestration (DIME
# dispatching to specialists) is a later wiring step.

set -uo pipefail
REPO="$(cd "$(dirname "$0")/.." && pwd)"
HERMES="${HERMES_HOME:-$HOME/.hermes}"

bring_up() {
  local AGENT="$1" src="$REPO/agents/open/$1"
  local name desc pdir
  name="$(printf '%s' "$AGENT" | tr '[:upper:]' '[:lower:]')"
  desc="$(grep -m1 '^\*\*Role:\*\*' "$src/soul.md" 2>/dev/null | sed 's/\*\*Role:\*\* *//')"
  [ -n "$desc" ] || desc="DeafPirate squad specialist"

  printf '── %-9s %s\n' "$name" "$desc"
  if hermes profile list 2>/dev/null | grep -qiw "$name"; then
    echo "     exists — refreshing identity"
  else
    hermes profile create "$name" --clone --description "$desc" 2>/dev/null \
      || hermes profile create "$name" --clone 2>/dev/null \
      || hermes profile create "$name"
  fi

  pdir="$HERMES/profiles/$name"
  if [ ! -d "$pdir" ]; then
    echo "     ! no $pdir — run 'hermes profile show $name' and tell Claude"
    return 0
  fi
  # HOUSE RULE: no keys/secrets in profile .envs. `--clone` copies the source
  # profile's .env wholesale (keys included) — scrub credential lines (set OR
  # empty; an empty `VAR=` still MASKS the global credential store) so every
  # profile falls through to the single global auth (OAuth / managed store).
  sed -i '/^ANTHROPIC_API_KEY=/d;/^ANTHROPIC_TOKEN=/d' "$pdir/.env" 2>/dev/null || true
  { cat "$src/soul.md"; printf '\n\n---\n\n'; cat "$src/brain.md" 2>/dev/null; [ -f "$REPO/CLIENT.md" ] && { printf '\n\n---\n\n'; cat "$REPO/CLIENT.md"; }; } > "$pdir/SOUL.md"
  if [ -d "$src/skills" ] && [ -n "$(ls -A "$src/skills" 2>/dev/null)" ]; then
    mkdir -p "$pdir/skills"; cp -r "$src/skills/." "$pdir/skills/"
  fi
  echo "     ✓ identity set (knows Vanessa via shared brain)"
}

echo "Bringing up the full squad from $REPO/agents/open"
echo
count=0
for d in "$REPO"/agents/open/*/; do
  [ -d "$d" ] || continue
  bring_up "$(basename "$d")"
  count=$((count+1))
done

echo
echo "════════════════════════════════════════════════════════"
echo "Done — $count agents up. Every one now carries the shared brain (they know you,"
echo "Vanessa, as the developer who holds the build lock)."
echo
echo "Chat with any:   dime chat · neil chat · eddie chat · gene chat · nikki chat …"
echo "                 (or:  hermes -p <name> chat)"
echo "See them all:    hermes profile list"
echo
echo "Next chapter: wiring DIME to actually dispatch to these specialists (orchestration)."
