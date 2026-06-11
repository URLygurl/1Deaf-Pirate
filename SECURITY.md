# SECURITY.md — DefPirate / Hermes squad

How we keep the squad — and Cory's machine — safe. Short, enforced, non-negotiable.

## Why this file exists

There is an active supply-chain worm targeting AI dev tooling (tracked as **UNC6780 /
"TeamPCP"**, the Shai-Hulud-style npm/PyPI strain, latest alias **"Hades"**). It backdoors
Claude Code and VS Code, hides in package install scripts, and steals secrets (API keys,
tokens, `.env`, `~/.ssh`, `~/.aws`, `~/.claude`). It self-spreads and has been open-sourced,
so copycats are running it too. This repo was audited clean — these rules keep it that way.

## Hard rules

1. **No untrusted dependencies. No auto-install.** The squad never runs `npm install`,
   `pip install`, `npx`, `curl | bash`, or any package/script fetch **without Cory's explicit
   sign-off.** Installing a dependency is a real-world action — it waits on the **action lock**,
   same as sending or deploying. "Proposed a dependency" and "installed it" are different words.
2. **Pin and review before adding.** Any new dependency gets named, justified, and pinned to a
   specific version, and its publisher/scope checked (prefer official scopes like
   `@anthropic-ai/*`). No typosquat-shaped names, no "latest" on anything that runs at install.
3. **No install scripts.** We do not add `preinstall` / `postinstall` / `prepare` hooks to any
   `package.json`, and we treat their presence in a new dependency as a red flag.
4. **Secrets live in `.env` only — never committed.** `.env` is gitignored; `.env.example`
   holds placeholders only. No keys, tokens, or credentials in tracked files, ever. Tokens come
   from environment variables (e.g. `${GITHUB_TOKEN}`), never hardcoded.
5. **`curl | bash` is run-remote-code.** The Hermes installer line in `docs/setup-hermes.md`
   (`curl … nousresearch.com/install.sh | bash`) is a *manual* step. Read the script first,
   confirm the domain, and only run it knowingly. The squad never pipes a remote script to a
   shell on its own.
6. **Claude Code config is guarded.** Changes to `.claude/` (hooks, `settings.json`,
   `.mcp.json`, MCP servers) are build changes — they wait on the **build lock** (developer
   approval). A hook that runs a shell command or an unfamiliar MCP server is a red flag.

## If something looks off

- **Suspected compromise on the machine** (not this repo): rotate the GitHub token and any API
  keys immediately, `npm audit` / check `pip` for unknown packages, and review recent
  `~/.claude`, `~/.ssh`, `~/.aws` access.
- **A new package** with install scripts, a weird scope, or network calls during install:
  stop, don't install, flag it to Cory.
- **Audit on demand:** read-only sweep for install hooks, `.github/workflows`, exfil patterns
  (`webhook.site`, `eval`, base64 blobs, credential paths), and committed secrets.

## Tie-in to the double HITL

This is the same principle the squad already runs on: **build changes wait for the developer;
real-world actions wait for Cory.** Installing software is both a build change and a
real-world action. The locks are the security model — nothing bypasses them.
