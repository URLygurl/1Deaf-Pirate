#!/usr/bin/env bash
# audit.sh — read-only supply-chain sweep for the DefPirate repo.
#
# Re-runs the same checks used to clear the repo against the active worm
# (UNC6780 / "TeamPCP" / Shai-Hulud-style / "Hades"): malicious deps, install
# scripts, backdoored Claude Code config, exfil patterns, committed secrets.
#
# READ-ONLY: inspects files only. Never installs, runs, or fetches anything.
# Usage:  bash scripts/audit.sh        (exit 0 = clean, 1 = something to review)

set -uo pipefail
cd "$(dirname "$0")/.." || exit 2
FINDINGS=0
note() { printf '  %s\n' "$1"; }
flag() { printf '  ⚠  %s\n' "$1"; FINDINGS=$((FINDINGS+1)); }
ok()   { printf '  ✓  %s\n' "$1"; }
EXCL=(--exclude-dir=.git --exclude-dir=node_modules --exclude=audit.sh)

echo "── DefPirate supply-chain audit ──────────────────────────"

echo "[1] Install scripts in package.json (pre/post-install, prepare)"
hits=$(grep -RInE '"(pre|post)?install"|"prepare"|"prepublish"' --include=package.json "${EXCL[@]}" . 2>/dev/null)
[ -n "$hits" ] && { flag "install scripts found — review:"; echo "$hits" | sed 's/^/      /'; } || ok "none"

echo "[2] Vendored node_modules / lockfiles drifting in"
nm=$(find . -path ./.git -prune -o -type d -name node_modules -print 2>/dev/null)
[ -n "$nm" ] && flag "node_modules present (should not be committed): $nm" || ok "no vendored node_modules"

echo "[3] GitHub Actions workflows (worm plants malicious ones)"
if [ -d .github/workflows ]; then
  flag ".github/workflows exists — review every file there"; ls .github/workflows | sed 's/^/      /'
else ok "no .github/workflows"; fi

echo "[4] Known worm artifact filenames"
art=$(find . -path ./.git -prune -o -type f \( -iname '*shai*hulud*' -o -iname 'bundle.js' \
  -o -iname 'processor.sh' -o -iname 'trufflehog*' -o -iname '*postinstall*' \) -print 2>/dev/null | grep -v node_modules)
[ -n "$art" ] && { flag "suspicious filenames:"; echo "$art" | sed 's/^/      /'; } || ok "none"

echo "[5] Exfil / credential-harvest patterns in code"
ex=$(grep -RInaE 'webhook\.site|trufflehog|\.aws/credentials|\.ssh/id_|atob\(|eval\(|child_process|subprocess\.|base64 -d|curl .*\| *bash|wget .*\| *bash' \
  "${EXCL[@]}" --include=*.js --include=*.mjs --include=*.cjs --include=*.ts --include=*.jsx --include=*.py --include=*.sh . 2>/dev/null)
[ -n "$ex" ] && { flag "review these (may be benign):"; echo "$ex" | sed 's/^/      /'; } || ok "none in code"

echo "[6] Claude Code config (.claude: hooks / MCP / settings)"
sh=$(grep -RInaE '"command"\s*:\s*"(bash|sh|node -e|python -c)"|hooks.*exec|curl|wget' .claude 2>/dev/null)
[ -n "$sh" ] && { flag "shell-ish entries in .claude — review:"; echo "$sh" | sed 's/^/      /'; } \
             || ok "no shell hooks / suspicious MCP commands"

echo "[7] Committed secrets / hardcoded keys"
sec=$(git ls-files 2>/dev/null | grep -iE '(^|/)\.env$|\.pem$|\.key$' )
[ -n "$sec" ] && { flag "secret-like files tracked:"; echo "$sec" | sed 's/^/      /'; } || ok ".env / keys not tracked"
keys=$(grep -RInaE 'sk-[a-zA-Z0-9]{20,}|ghp_[a-zA-Z0-9]{20,}|github_pat_|AKIA[0-9A-Z]{16}|-----BEGIN.*PRIVATE KEY-----|xox[baprs]-' "${EXCL[@]}" . 2>/dev/null)
[ -n "$keys" ] && { flag "hardcoded key patterns:"; echo "$keys" | sed 's/^/      /'; } || ok "no hardcoded keys"

echo "──────────────────────────────────────────────────────────"
if [ "$FINDINGS" -eq 0 ]; then echo "RESULT: ✓ clean — no supply-chain indicators found."; exit 0
else echo "RESULT: ⚠ $FINDINGS item(s) to review above (may be benign — read before acting)."; exit 1; fi
