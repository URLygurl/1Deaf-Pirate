# Channels & multi-user access — PARKED for tomorrow

> Captured 2026-06-12 for the next session. **Not built yet** — this is the agenda,
> pre-thought so tomorrow is fast. Covers *how each human reaches the squad* and the
> identity / permissions / security that governs it.

## What Vanessa flagged
Adding more **surfaces** and more **people**:
- **Surfaces:** desktop apps, iPhone apps, **Telegram** (web already exists: the
  NakedApp dashboard + the Hermes dashboard via 1Panel).
- **People:** Vanessa (operator/admin), **Cory** (client), and other **end users**.

## Two distinct audiences — don't conflate them
- **Operator deck** → *Vanessa* oversees, steers, approves. Rich web cockpit (via
  1Panel). See `operator-console-handoff.md`.
- **End-user channels** → *Cory + others* just talk to an agent. Simple, safe,
  scoped. NakedApp dashboard (built) + Telegram + mobile.

## Pre-thought considerations (so tomorrow moves)
1. **Telegram = a gateway channel.** It's the first real *inbound* surface.
   ⚠️ **Set the user allowlist BEFORE enabling it** (the gateway already warned
   "no allowlists configured"). One channel at a time — per `pre-launch-checklist.md`.
2. **Multi-user identity/permissions.** The brain already knows Vanessa=admin,
   Cory=client. Extend: who each end user is, which agents they reach, what they can
   trigger, and the **action-lock per user**.
3. **NEIL stays send-less at the exposed front** — end-user-facing, drafts/triages,
   no outbound tools.
4. **Web-first for *Vanessa's* surfaces** (Intel iMac + entrenched-app pain), but
   **desktop + iPhone are legit for *other* users' machines** — Hermes Desktop
   (cross-platform) + mobile via Telegram / a PWA.
5. **Per-channel auth + allowlist, always** — never an open channel.

## Likely first move tomorrow
Wire **Telegram** as the first end-user channel: allowlist → bot token (distinct per
profile) → which agent answers → test with Cory.
