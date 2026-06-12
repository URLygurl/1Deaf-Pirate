# 04 · Runbook Library

*Step-by-step procedures. Each: when to use → steps. Add one whenever you do
something twice. All commands run in the box terminal.*

---

## RB-01 · Rebuild the whole box from scratch
**When:** box bricked, or you want a clean machine (no detritus).
**Model:** don't repair a dirty box — *replace* it.
1. (Optional) Take a final DO snapshot if you want the old state.
2. Destroy the droplet → create a fresh Ubuntu droplet.
3. Install Hermes (`docs/setup-hermes.md`), add the Anthropic key.
4. `git clone` this repo → `cd 1Deaf-Pirate`.
5. Run the bring-up sequence (RB-02 → RB-04).
6. Restore secrets from your vault/`.env` backup (never from git).
> A single `scripts/provision.sh` to do steps 3–5 in one shot is planned.

## RB-02 · Bring up the squad
**When:** fresh box, or profiles missing.
```
export PATH="$HOME/.local/bin:$PATH"
cd ~/1Deaf-Pirate && git pull
bash scripts/bring-up-squad.sh      # creates the 15 profiles + shared brain
```

## RB-03 · Assign a specialist's skills
**When:** giving a profile its optional toolkit.
```
bash scripts/assign-skills.sh <name>           # batch (easiest-first per docs/skills-rollout.md)
hermes -p <name> skills install <id>           # manual — to SEE the scan + confirm
hermes -p <name> skills list                   # verify
```
⚠️ Each install **quarantines → security-scans → prompts `Confirm [y/N]`**. Official
Nous skills may scan **DANGEROUS** but are **ALLOWED (builtin)** — expected. Installs
are ~10–15s; if the batch script looks frozen it's stuck on the hidden confirm prompt
— run manually to clear it.

## RB-04 · Start / check the gateway
```
hermes gateway status
hermes gateway install      # first time — installs the systemd user service
hermes gateway start
```
Without a running gateway, Kanban cards sit in `ready` forever.

## RB-05 · View the dashboard off-box
**Why it's not trivial:** it binds to `127.0.0.1:9119` (localhost only).
**Clean route:** reverse-proxy it through **1Panel** (WebSites) with a login — never
expose the raw port publicly (it has no auth of its own).

## RB-06 · Snapshot & restore (DO)
**When:** before risky changes, or at a known-good state.
- DO panel → droplet → **Backups & Snapshots → Take Snapshot**.
- Restore: create a droplet *from* the snapshot. Full undo.

## RB-07 · Contain / kill a runaway worker
- See it: `hermes kanban list` / the dashboard.
- Hard stop everything: power off the droplet (DO panel) or revoke the
  `ANTHROPIC_API_KEY` (Anthropic console) → the squad can't think.
- `kanban.failure_limit` auto-blocks thrashing tasks.

## RB-08 · Add a new agent/profile
1. Copy `agents/_template/` → `agents/open/<NAME>/`, fill `soul.md` + `agent.json`.
2. Add to `03-registry.md` + `agents/ROSTER.md`.
3. Bring it up (RB-02) and assign skills (RB-03).
