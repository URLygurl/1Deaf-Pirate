# profiles/ — the Org Chart (operator staff)

A second layer, distinct from the music squad in `agents/`. These are **operator
staff** — the people who'd run a company's back office. They serve **Vanessa (the
owner/admin)** and are orchestrated by **DIME**, same locks, same shared brain.

| Profile | Lane |
|---|---|
| `chief-of-staff` | Knows the user's high-level priorities; runs the daily brief. |
| `head-of-research` | Drills deep on competitor analysis + market trends. |
| `head-of-content` | Drafts & schedules social posts and articles. |
| `head-of-finance` | Reconciles Stripe, subs, and runway. |

## The morning brief — daily parallel fan-out

> One trigger every morning (**Telegram → DIME**, or a cron) wakes **all four**
> profiles **in parallel**. Each does its slice; DIME synthesises **one** brief back.

```
06:30 trigger ─▶ DIME (orchestrator)
                  ├─▶ chief-of-staff   → today's priorities + decisions needed
                  ├─▶ head-of-research → overnight competitor / market moves
                  ├─▶ head-of-content  → what's scheduled / drafts awaiting approval
                  └─▶ head-of-finance  → cash position, subs, runway delta
                  ▼
            one morning brief → Vanessa
```

- **Mechanism:** Kanban fan-out — DIME creates one card per profile (parallel,
  no dependencies), reads the four handoffs, returns one synthesis. The daily
  trigger is a schedule (cron / gateway) that drops the parent card each morning.
- **Locks hold:** these profiles **prepare** — any real-world action (post, pay,
  send) waits at the **action-lock** for Vanessa. Drafted ≠ done.

## Status — scaffold

These `SOUL.md` files are **scaffolds**: role line + safety rule are set; the
Personality / Style / Technical posture sections are placeholders. Per Vanessa,
**DIME will help choose and flesh them out.**

**Not yet wired** (box-side, when ready):
1. A bring-up step to turn these definitions into real Hermes profiles (mirror
   `scripts/bring-up-squad.sh`).
2. The daily trigger (cron/gateway schedule) + DIME's fan-out card template.
