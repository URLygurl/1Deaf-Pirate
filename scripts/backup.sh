#!/usr/bin/env bash
# Full off-machine backup of the DefPirate / Hermes work.
# So a wrecked computer never costs us the project (or the shared memory of it) again.
#
# Usage:  bash scripts/backup.sh
# Result: a dated .tar.gz in ~/Documents/_backups/  — then push/copy it OFF this machine.

set -euo pipefail
STAMP="$(date +%Y-%m-%d_%H%M)"
DEST="$HOME/Documents/_backups"
mkdir -p "$DEST"
ARCHIVE="$DEST/deafpirate-FULL-$STAMP.tar.gz"

echo "Backing up everything → $ARCHIVE"
tar -czf "$ARCHIVE" \
  -C "$HOME" \
  ".claude" \
  ".remember" \
  "Documents/nakedapp" \
  "Documents/PW/AI Squads" \
  "projects/1Deaf-Pirate" 2>/dev/null || true

echo "Done: $(du -h "$ARCHIVE" | cut -f1)  $ARCHIVE"
echo "NOW MOVE IT OFF-MACHINE:  push to git, drop in iCloud/Drive, or copy to an external disk."
