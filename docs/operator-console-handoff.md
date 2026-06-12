# Operator Command-Deck — Handoff

> **Provenance.** Reconstructed 2026-06-12 from Vanessa's chat handoff after the
> prior (~month-long) session lost context. That session *reported* committing
> this doc but never actually wrote it to the repo — so this is the first real,
> on-disk copy. Source of truth: Vanessa's paste, not recovered files.
>
> **Trust flags.** Items marked **[UNVERIFIED]** come only from the prior chat's
> summary and have **not** been confirmed against a real product/repo. Treat as
> leads to check, not facts. Per `CLAUDE.md`: preview before install.

## The goal

Pick the **GUI Vanessa uses to run the squad** — the **command deck** above the
terminal. From it she can:
- **chat** with agents to teach/guide/steer,
- **approve** their actions (this is the double-HITL gate, surfaced as UI),
- **oversee / direct / strategise** across sessions.

The squad **executes in the terminal**; the GUI sits on top. It is *not* the
end-user channel.

## Corrected facts (what the prior session had lost)

- **Host is NOT Lightning.** Moving to **DigitalOcean**. Any docs that still say
  Lightning are stale. *(Note: no `setup-hermes.md` / `roadmap.md` exist in this
  repo yet — so there's nothing to un-stale here. Create them right when we do.)*
- **End-user channel is already built.** The **NakedApp dashboard chat GUI** is
  how no-computer-knowledge users reach an agent. That layer is handled — the
  command deck is a *separate*, operator-facing tool.
- **Hardware constraint:** the operator iMac is **Intel (2014), Sequoia via
  OCLP** → Apple-Silicon-only apps won't open. **Web GUIs dodge this entirely.**
  Any native-app candidate must run on Intel macOS.

## Shortlist [UNVERIFIED — confirm each before trusting]

| Candidate | Verdict (per prior chat) | Why |
|---|---|---|
| **Hermes-Studio** | ★ front-runner | Only one with real **approval gates** (= double-HITL) + two-way chat + multi-session. Web, runs on Intel. Said to be **MIT** → forkable as a spec base. |
| **war-room** | out | No approval gates. |
| **dodo-reach** | wrong layer | Single chat, not a command deck. Notable: Universal app that *does* run on Intel. |
| **atomicbot** | skip | Unverified. |

> ⚠️ Because the prior session fabricated this doc, **the candidate names
> themselves may be hallucinated.** First job before any decision: verify that
> "Hermes-Studio" et al. actually exist (search, find the repo, check the
> license). If they don't, we go straight to a custom build.

## The plan

1. **Trial** a candidate (preview-first), **or** scope a **custom build**
   (Hermes-Studio's MIT claim, *if real*, gives a fork/spec base).
2. Stand up the **engine base on DigitalOcean** (Hermes CLI + profiles).
3. Write the host/setup docs fresh against **DigitalOcean** (don't inherit
   Lightning assumptions).

## Next steps

1. **Verify the shortlist** — confirm the candidates are real before choosing.
2. Decide: **trial the front-runner** vs **scope a custom build**.
3. Stand up the DigitalOcean engine base.
4. Author `setup-hermes.md` / `roadmap.md` correctly the first time.

## Status

- [x] Handoff context recovered from Vanessa's note
- [x] This doc made real (on disk, committed)
- [ ] Shortlist candidates verified to exist
- [ ] Trial-vs-build decision made
- [ ] DigitalOcean engine base stood up
