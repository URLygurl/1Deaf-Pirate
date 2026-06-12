#!/usr/bin/env bash
# assign-skills.sh
# Gives each specialist its REAL Hermes toolkit — installs the optional skills
# mapped in docs/hermes-skills-map.md onto each profile.
#
# Bundled skills (73) already auto-sync into every profile, so we don't touch
# those. This script installs the *optional* ones (97 available) per specialist —
# the one-line `hermes -p <name> skills install <id>` calls, batched.
#
# Run on the box AFTER bring-up-squad.sh, inside the cloned repo:
#     git pull && bash scripts/assign-skills.sh
#
# Safe to re-run: already-installed skills are skipped by Hermes.
# Override a single specialist:  bash scripts/assign-skills.sh eddie
#
# Note: skill ids here track the optional-skills catalogue. If Hermes renames or
# drops one, that single install warns and the rest continue — nothing aborts.

set -uo pipefail

# ── the map: lowercase profile  →  space-separated optional skill ids ──────────
# Mirrors docs/hermes-skills-map.md. Bundled skills (claude-code, codex, plan,
# tdd, root-cause-debugging, kanban-orchestrator …) are intentionally omitted —
# they ship in every profile already.

declare -A SKILLS=(
  # Engineering
  [eddie]="blackbox grok openhands code-wiki rest-graphql-debug subagent-driven-development"
  [geddy]="code-wiki architecture-diagram concept-diagrams subagent-driven-development"
  [slash]="watchers"
  [halford]="web-pentest sherlock domain-intel oss-forensics 1password github-code-review"
  [hetfield]="docker-management"
  [lemmy]="docker-management pinggy-tunnel hermes-s6-container-supervision modal lambda-labs"

  # Business / content
  [gene]="3-statement-model dcf-model lbo-model merger-model comps-analysis excel-author pptx-author stocks shopify shop-app seo-fundamentals"
  [nikki]="humanize-text meme-generation baoyu-article-illustrator hyperframes youtube-content xurl manim p5js"
  # NEIL is the exposed front desk (bidirectional public layer) — deliberately
  # given NO outbound-send tools. No email, no phone. If he's ever manipulated
  # at the front, he has nothing to send/call with. He drafts + triages; the
  # actual send/call is held at the action-lock (or routed to a gated internal
  # sender later — Vanessa's call). See docs/hermes-skills-map.md.
  [neil]=""
  # GIGGUIDE is internal (scheduling/logistics, not exposed) — google-workspace
  # here is for Calendar. He's not the front desk, so the send surface isn't the
  # same risk; still, keep him to calendar/logistics, not a comms channel.
  [gigguide]="google-workspace maps airtable notion"

  # Strategy / research / creative
  [dio]="creative-ideation"
  [randy]="arxiv duckduckgo-search searxng-search osint-investigation domain-intel scrapling parallel-cli qmd polymarket blogwatcher llm-wiki"
  [angus]="creative-ideation idea-validation darwinian-evolver"
  [ozzy]="darwinian-evolver"
)

# Music side — the squad's actual specialty. Shared across the song-makers
# rather than owned by one lane (songwriting + actual MusicGen generation).
MUSIC_MAKERS="eddie nikki"
MUSIC_SKILLS="songwriting heartmula audiocraft"

assign() {
  local name="$1" ids="${SKILLS[$1]:-}"
  [ -n "$ids" ] || { printf '── %-9s (no optional skills mapped)\n' "$name"; return 0; }

  printf '── %s\n' "$name"
  local id ok=0 fail=0
  for id in $ids; do
    # Announce the skill BEFORE installing, with no newline — so the line you
    # see is exactly the skill currently working. A ✓/✗ lands when it finishes.
    # Heavy ones (blackbox, openhands, docker-management, audiocraft …) can sit
    # for a minute here — that's normal, not stuck.
    printf '     • %-34s' "$id"
    # </dev/null  → a heavy installer can never hang waiting on a hidden prompt
    #               (it gets EOF and fails fast instead of stalling forever).
    # timeout     → backstop: if one genuinely wedges, skip it after N seconds
    #               and keep going, so the run never freezes on one bad skill.
    timeout "${SKILL_TIMEOUT:-300}" hermes -p "$name" skills install "$id" </dev/null >/dev/null 2>&1
    rc=$?
    if [ "$rc" -eq 0 ]; then
      printf ' ✓\n'; ok=$((ok+1))
    elif [ "$rc" -eq 124 ]; then
      printf ' ⏳ timed out, skipped (heavy — retry later)\n'; fail=$((fail+1))
    else
      printf ' ✗ skipped\n'; fail=$((fail+1))
    fi
  done
  printf '     %d installed%s\n' "$ok" "$([ "$fail" -gt 0 ] && printf ', %d skipped' "$fail")"
}

# Single-specialist mode:  assign-skills.sh eddie
if [ "$#" -gt 0 ]; then
  assign "$(printf '%s' "$1" | tr '[:upper:]' '[:lower:]')"
  exit 0
fi

echo "Assigning real Hermes skills per docs/hermes-skills-map.md"
echo "(bundled skills already ship in every profile — this adds the optional ones)"
echo
for name in eddie geddy slash halford hetfield lemmy \
            gene nikki neil gigguide \
            dio randy angus ozzy; do
  assign "$name"
done

# Music toolkit — the song-makers can literally write + generate music
echo
echo "── music toolkit ($MUSIC_SKILLS) ──"
for m in $MUSIC_MAKERS; do
  for id in $MUSIC_SKILLS; do
    printf '     • %-8s ← %-12s' "$m" "$id"
    timeout "${SKILL_TIMEOUT:-300}" hermes -p "$m" skills install "$id" </dev/null >/dev/null 2>&1 \
      && printf ' ✓\n' || printf ' ✗ skipped\n'
  done
done

echo
echo "════════════════════════════════════════════════════════"
echo "Done. Each specialist now carries its real toolkit."
echo "Check one:   hermes -p gene skills list"
echo "Browse all:  hermes skills browse"
echo
echo "Next: wire orchestration — DIME as orchestrator_profile + kanban board."
