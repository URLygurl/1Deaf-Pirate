# 05 · Recovery Notebook

*The "it broke / I want it clean" notebook. The mindset: the box is **disposable**,
the recipe is the **source of truth**. You never surgically un-mess a dirty box —
you rebuild a clean one.*

## What lives where (so you know what's recoverable)
| Thing | Where | Recoverable from |
|---|---|---|
| Agent definitions, docs, scripts | git (`~/1Deaf-Pirate`) | **GitHub** — `git clone` brings it all back |
| Secrets (API keys, bot tokens, 1Panel entrance) | `.env` / DO panel | **your own backup** — NOT in git, back these up separately |
| Profiles, Kanban DB, brain | the box (`~/.hermes/`) | DO **snapshot** (or rebuild via bring-up) |
| 1Panel + Docker apps | the box | DO snapshot (or reinstall + redeploy) |

> 🔑 The one thing git can't save you on is **secrets**. Keep an offline/vault copy.

## The golden rule (learned the hard way)
**Push everything.** Git is the backup. The "10-hour wipeout" only hurts what wasn't
committed. After any change: commit + push. If the box vanished now, a fresh clone is
the whole project minus secrets.

## Rebuild-from-scratch
Follow **RB-01** in `04-runbooks.md`. Two-minute version:
`fresh droplet → install Hermes + key → git clone → bring-up → restore secrets.`

## Restore-from-snapshot (faster if you have one)
DO panel → create droplet **from snapshot** → you're back at that exact moment,
secrets and all. Take snapshots at known-good states.

## Off-switches (when in doubt, stop it)
- **Power off / destroy** the droplet (DO panel) — atomic halt.
- **Revoke / rotate** `ANTHROPIC_API_KEY` (Anthropic console) — the squad can't think.
- **Network:** DO Cloud Firewall (planned) — cut egress.
- Full failsafe design: `docs/failsafes.md`.

## After any incident
Write what happened + the fix here (or a new runbook). The control room only stays
useful if it remembers. Last incident wins → updates the docs.
