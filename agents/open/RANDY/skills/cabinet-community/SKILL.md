---
name: cabinet-community
description: Use when the user wants real-world DIY builder wisdom, build-thread conventions, or community sanity-checks on a speaker-cabinet plan — "what do people on diyAudio do for this", "is this a normal way to build it", "how do hobbyists tune/brace this", "sanity-check my build plan against common practice". Translates forum build-thread norms into actionable guidance alongside RANDY's T/S math. NOT a live web fetch (it is distilled community knowledge), and NOT for the formal sealed/ported math (use enclosure-tuning-rule).
---

# Cabinet Build-Community Practice

DIY speaker forums (diyAudio and kin) have settled, hard-won conventions that complement the textbook math: how people actually pick alignments, brace, test, and avoid the classic rookie mistakes. This skill surfaces that practical consensus and reconciles it with RANDY's Thiele/Small rules, so a build plan survives contact with reality.

## Instructions
1. Frame advice as "common community practice" plus RANDY's rule — make clear what is convention vs what is RANDY's gate.
2. Reinforce the workflow builders actually follow: measure or trust manufacturer T/S -> simulate the box (WinISD/VituixCAD/hornresp) -> verify the alignment -> prototype -> measure response -> adjust port/fill.
3. Echo the consensus gates so the user isn't surprised: low Qts / high EBP -> ported; high Qts / low EBP -> sealed; matches RANDY (Qts 0.4/0.45, EBP 50/100).
4. Pass on the recurring forum cautions:
   - Trust-but-verify manufacturer T/S; mass-loaded/break-in shifts Fs and Qts. Re-measure if it matters.
   - Account for driver, port, and brace displacement in net volume — the single most common build miss.
   - Port velocity: keep it low (rule of thumb under ~17-20 m/s) or you get chuffing; go bigger-diameter and flare the ends, accept the longer port.
   - A port that comes out absurdly long means the tuning/diameter combo is wrong, or the driver wants sealed.
   - Round/flare port ends and keep the inner port mouth clear of panels.
5. Encourage simulating before cutting wood, and measuring (REW + mic) after, rather than guessing.
6. When the user pastes a plan, sanity-check it against these norms and call out the one or two highest-risk items, not a wall of nitpicks.

## Examples
- User: "Is it normal to just trust the spec-sheet T/S, or do people measure?" -> Community norm: trust for a first sim, but serious builders measure (DATS/clio/REW) because real Fs and Qts drift with break-in and unit-to-unit spread. Re-measure when the alignment is borderline.
- User: "My WinISD port came out 600 mm long — is that right?" -> Flag as a classic sign the port diameter is too small or the tuning too low for the box. Community fix: larger-diameter flared port (accept some length) or reconsider sealed; check port velocity for chuffing.
- User: "Sanity-check: 38 Hz driver, ported, no internal bracing, port mouth against the back wall." -> Two red flags by forum consensus: missing bracing on a low-tuned box, and a port mouth too close to a panel (raise it, flare it). Confirm tuning Fb ~= Fs*0.85.
- User: "What software do people use?" -> WinISD and VituixCAD for box/crossover, hornresp for horns/TLs, REW for measurement. Simulate, then prototype, then measure.

## Guidelines
- Do separate "convention" from "RANDY's rule" so the user knows which is opinion and which is the math gate.
- Do prioritize the highest-risk issues; builders abandon plans drowned in nitpicks.
- Don't present this as a live forum scrape — it is distilled practice; route the actual numbers to enclosure-tuning-rule.
- Edge case: exotic alignments (transmission line, tapped horn, passive radiator) need their own sims; say so rather than forcing the standard sealed/ported gate.
- Output expectation: practical, prioritized, reconciled with RANDY's T/S gates, in millimetres.
- Canonical reference: https://www.diyaudio.com/community/threads/speaker-cabinet-build.267582/
