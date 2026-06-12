# Operator Console (GUI) — Handoff

**Date:** 2026-06-12 · **For:** the next session (fresh chat) · **Owner:** Cory · **Dev:** Vanessa
**Branch:** `claude/hermes-agent-plugins-4FrT9`

> Read `START-HERE.md` + `CLAUDE.md` first, then this. This captures one decision thread:
> **which GUI Cory uses to run the squad** (oversight, direction, strategy, chat, approvals).
> A fresh session reads this and is continuous — not a reset.

---

## TL;DR

We were choosing an **operator command-deck GUI** for Cory — the cockpit he uses to **chat with
agents (teach/guide/correct), approve their actions, and oversee the fleet**. After evaluating the
community options, the front-runner is **Hermes-Studio** (it's the only one with real approval
gates). Cory's plan: **trial several**, and if none fit, **build his own**. Nothing is installed
yet — next session does the preview-first setup or the build scoping.

## Goal (what the GUI is for)

Two layers, kept separate:
- **Execution layer = terminal.** The squad *runs* here.
- **Command layer = GUI (this decision).** Cory sits above it: two-way chat to teach/guide,
  **approve/deny** actions (his double-HITL), oversight + direction + strategy, "all aspects."

Cory is the **single operator** at this deck. The naive end users never touch it.

## Corrected facts (don't repeat these mistakes)

- ❌ **Not Lightning anymore.** Host moved to **DigitalOcean** (always-on Droplet, $200 credit
  redeeming). Lightning was unstable. The stale Lightning references in `setup-hermes.md`,
  `roadmap.md`, `architecture.md`, and `failsafes.md` are now **reconciled to DigitalOcean**.
- ✅ **End-user channel already exists.** The user-facing **NakedApp** (`music-events-platform-prod`)
  has the **dashboard chat GUI** — that's how the no-computer-knowledge end users reach an agent.
  *Not* a terminal at their end. This is largely handled; the operator console is a separate surface.
- 🖥️ **Cory's machine: 2014 iMac, Intel chip, macOS Sequoia via OCLP patch.** The patch runs modern
  macOS but can't change the chip → **Apple-Silicon-only apps show the "no-entry" symbol and won't
  open.** This is why Nous's native desktop `.dmg` failed. **Fix the whole class of problem by using
  a web GUI** (runs in the browser, chip-agnostic) hosted on the Linux engine box.

## Options evaluated

| Option | Type / runs on Intel? | Two-way chat | **Approvals (HITL)** | Multi-session | Verdict |
|---|---|---|---|---|---|
| **JPeetz/Hermes-Studio** | Web · ✅ | ✅ SSE streaming | ✅ approve/deny/always-allow, inline cards, scopes | ✅ + crews (8), profile-isolated | **★ Front-runner** — only one with real approval gates; matches double-HITL |
| **Naroh091/war-room** | Web · ✅ | ✅ steer orchestrator | ❌ **none** | ❌ single-operator | Out — no approvals (non-negotiable) |
| **dodo-reach/hermes-desktop** | Native Swift, **Universal** · ✅ | ✅ (single SSH chat) | n/a | ❌ | Wrong layer — single-chat companion, not a fleet deck. (Notable: it *does* run on Intel.) |
| **atomicbot.ai/hermes** | Commercial · ❓ | ? | ? | ? | Unverified (blocked fetch, closed source) — skip for now |

Security note: threat-intel scan returned **"unknown" (not flagged malicious, not certified safe)**
for all four — they're community projects, so **preview before installing** per `SECURITY.md`.

## Recommendation

**Hermes-Studio**, web app, **installed on the DigitalOcean engine box**, driven from the iMac
**browser** (mobile too via Tailscale). This sidesteps the Intel limitation entirely and its
**approval cards are Cory's double-HITL almost line-for-line** ("drafted ≠ done, hold at the line").
Requires: Hermes CLI + a profile on the box, Node 22+ (or Docker).

## Cory's plan

> "Probably going to try several of these apps/GUIs, then if I don't find one I like, I'll
> probably build one."

So treat the above as a **shortlist to trial**, not a final pick. If building:
- **Hermes-Studio is MIT-licensed** → good **reference spec / fork base**. Its feature set *is* the
  spec: web UI, SSE chat with tool-call rendering, **approval cards (once/session/always)**,
  permissions & toolsets, multi-session + crews, profile-scoped workspaces.
- Must be **web (browser)** or **Universal native** to run on the Intel iMac.

## Open items / parked

- [ ] **Pick & trial** GUIs (Studio first) — preview-first per `SECURITY.md`.
- [ ] **Decide build-vs-buy** after trialling.
- [x] **Update stale docs**: Lightning → DigitalOcean reconciled in `setup-hermes.md`, `roadmap.md`, `architecture.md`, `failsafes.md`.
- [ ] **End-user channel**: confirm NakedApp chat dashboard is the final answer (looks handled).
- [x] Engine base on DigitalOcean: Hermes CLI installed + 15 profiles wired + DIME orchestrator + Kanban board live. *(Flip DIME/NEIL to `live` is the separate Phase 5 gate.)*

## Next steps for the fresh session

1. Read `START-HERE.md`, `CLAUDE.md`, then this file.
2. Ask Cory: **trial Hermes-Studio first, or scope a custom build?**
3. If trialling: write **previewed, one-move-at-a-time** setup steps for Hermes-Studio on the
   DigitalOcean box (Hermes CLI + profile + Node 22/Docker), driven from the iMac browser.
4. If building: turn the Hermes-Studio feature set into a spec; decide stack (web).
5. Keep `SECURITY.md` (preview before install) and double-HITL throughout.
