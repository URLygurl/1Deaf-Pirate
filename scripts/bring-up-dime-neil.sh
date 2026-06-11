#!/usr/bin/env bash
# bring-up-dime-neil.sh
# Creates DIME + NEIL as Hermes profiles, using this repo's souls.
# Run on the Hermes box, from inside the cloned repo:
#     bash scripts/bring-up-dime-neil.sh
#
# Each profile inherits your CURRENT config (Claude key + model) via --clone,
# then gets its identity from agents/open/<NAME>/soul.md (+ shared brain.md).
# Private layers (god.md / tuning.md) are gitignored and NOT on this box by
# design — we add those privately later.

set -uo pipefail
REPO="$(cd "$(dirname "$0")/.." && pwd)"
HERMES="${HERMES_HOME:-$HOME/.hermes}"

bring_up() {            # $1=profile(lowercase)  $2=repo agent dir  $3=description
  local name="$1" src="$REPO/agents/open/$2" desc="$3"
  echo "── Bringing up ${name} ───────────────────────────────"
  if hermes profile list 2>/dev/null | grep -qiw "$name"; then
    echo "  profile '${name}' already exists — keeping its config"
  else
    hermes profile create "$name" --clone --description "$desc" 2>/dev/null \
      || hermes profile create "$name" --clone 2>/dev/null \
      || hermes profile create "$name"
  fi

  local pdir="$HERMES/profiles/$name"
  if [ ! -d "$pdir" ]; then
    echo "  ! can't find $pdir — run 'hermes profile show $name' and send Claude the paths"
    return 1
  fi

  # SOUL = persona (soul.md) + the shared squad brain (brain.md)
  { cat "$src/soul.md"; printf '\n\n---\n\n'; cat "$src/brain.md" 2>/dev/null; } > "$pdir/SOUL.md"
  echo "  ✓ SOUL.md set  ($pdir/SOUL.md)"

  if [ -d "$src/skills" ] && [ -n "$(ls -A "$src/skills" 2>/dev/null)" ]; then
    mkdir -p "$pdir/skills"
    cp -r "$src/skills/." "$pdir/skills/"
    echo "  ✓ skills copied"
  else
    echo "  · no skills folder for ${name} yet (fine for first hello)"
  fi
}

echo "Repo : $REPO"
echo "Hermes: $HERMES"
echo
bring_up dime DIME "Orchestrator — reads intent, routes to the right specialist, one clear voice out."
bring_up neil NEIL "Front-of-house concierge — warm, calm, relays between you and the crew."

echo
echo "════════════════════════════════════════════════════════"
echo "Done. Meet them:"
echo "    dime chat        (or:  hermes -p dime chat)"
echo "    neil chat        (or:  hermes -p neil chat)"
echo
echo "List/inspect:  hermes profile list   ·   hermes profile show dime"
echo
echo "Heads up: DIME won't fully orchestrate the 13 specialists yet (they're not"
echo "set up), and the silent layers (god/tuning) aren't on this box. This first"
echo "pass is to meet DIME's & NEIL's *voice*. We deepen it together from there."
