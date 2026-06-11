# START HERE — DeafPirates HQ

**If you're a new session (or coming back cold), read this first. It gets you fully up to
speed in one step, so a new session is a *continuation*, never a reset.**

---

## What this repo is

This is **HQ** for **DeafPirates** — a 15-agent squad orchestrated by **Hermes / DIME**.
This repo holds *who the agents are and how they're wired* (definitions, skills, docs, design,
dashboards). It is **not** the product code — that lives in separate repos (see "Two sessions").

> Branding/name: the product is **DeafPirates** (one word); branding + logo are deferred to
> the very end. Older files may say `DefPirate` / `Deaf Pirate` — same thing.

## Read these, in order
1. **`CLAUDE.md`** — the project brain (what we're building, conventions, house rules).
2. **`docs/dual-purpose-capability-map.md`** — the 15 agents, their music + productive lanes,
   what's built vs to-build, and the **"needs the owner" gate list** (the live to-do).
3. **`SECURITY.md`** — non-negotiable: no untrusted deps / no auto-install, secrets in `.env`.
4. **`docs/design.md`** + **`world/brand/tokens.css`** — visual system (deferred for polish,
   but the source of truth meanwhile).
5. **`dashboards/README.md`** — the UI surfaces (floor, hub, chat, task board) + their status.

## The squad at a glance
**15 = DIME** (Hermes — orchestrator, makes first contact) **+ NEIL** (front-facing concierge)
**+ 13 specialists** (LEMMY, EDDIE, GEDDY, SLASH, HALFORD, HETFIELD, GENE, NIKKI, GIGGUIDE,
ANGUS, RANDY, DIO, OZZY). Each lives in `agents/open/<NAME>/` with a `soul.md` (identity) and a
`skills/` folder. They're **world-class music experts *and* a productive crew** (SEO, webapp,
email, full-stack dev) — see the capability map.

> Some per-agent layers are intentionally **gitignored** (private/local — see the owner).
> A fresh clone won't show them; that's by design, not loss.

## How to behave here (house rules)
- **Double-HITL, always.** *Build* changes wait for the **developer's** approval; *real-world*
  actions (send/post/pay/book/contact/deploy/install) wait for **the owner's** approval.
  Prepare fully, hold at the line. **"Drafted" ≠ "done."**
- **Security:** never install a package / run `curl|bash` without explicit sign-off (`SECURITY.md`).
  Re-audit anytime with `bash scripts/audit.sh` (read-only, exit 0 = clean).
- **Secrets** live in `.env` (gitignored). Never commit keys.
- **Work on the feature branch** and commit + push as you go. Current branch:
  **`claude/hermes-agent-plugins-4FrT9`**.

## Two sessions (this is why a "new session" is fine)
- **HQ session** → repo `1deaf-pirate` (this one): squad, docs, design, planning. *Stay here for everything except product code.*
- **Workshop session** → repo `music-events-platform-prod` (the **NakedApp**, live product):
  where the build crew writes real code. Start it from claude.ai/code, on that repo.
  Also: `naked-app-muso-skills` = idea/skills source to copy from.
- Web sessions are scoped to one repo at start and can't be widened from inside — so the two
  coexist. Continuity lives in **git**, not in any one chat.

## Where we are / what's next
- ✅ Squad defined, productive lanes encoded, security audited + `SECURITY.md`, design system
  locked (polish deferred), dashboards staged, **Background Ops task board** built, repo access
  working (workshop session reaches the NakedApp).
- ⏳ **Owner gates** (none urgent, see capability map for the live list):
  1. API keys → `.env` (Anthropic, Gemini, Kimi/MiniMax, `GITHUB_TOKEN`)
  2. Flip **DIME + NEIL** to `status: live` (the staged reveal / double-HITL)
  3. Deploy creds (Railway)

## Resuming in any new session — paste this
> *"Read `START-HERE.md` and `CLAUDE.md` in this repo, then pick up where we left off.
> Work on branch `claude/hermes-agent-plugins-4FrT9`. Respect the double-HITL and `SECURITY.md`."*

That's it — a new session reads this and we're continuous. Nothing's ever starting from zero.
