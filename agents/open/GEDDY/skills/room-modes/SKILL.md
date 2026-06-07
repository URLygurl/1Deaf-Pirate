---
name: room-modes
description: Use when the question involves standing waves and resonances in a room — room modes, axial/tangential/oblique modes, modal frequencies, calculating mode frequencies from room dimensions, the Schroeder frequency, modal density, room ratios (Bolt/Louden/golden ratios), bass buildup, nulls, and low-frequency treatment with bass traps or speaker/listener placement. Trigger on phrases like "room modes", "standing waves", "calculate room modes", "boomy bass", "bass nulls", "Schroeder frequency", "room ratio", "where to put my desk/sub". This is GEDDY's modal-analysis skill — NOT for broadband reverberation (use architectural-acoustics).
---

# Room Modes

This skill lets GEDDY analyze and tame low-frequency resonances in rectangular rooms. Below the Schroeder frequency, sound behaves modally — discrete standing waves cause large, position-dependent peaks and nulls. The skill computes those modes, evaluates room ratios, and prescribes placement and treatment. Canonical reference: https://en.wikipedia.org/wiki/Room_modes

## Instructions

1. Compute modal frequencies for a rectangular room with the Rayleigh equation:
   **f(nx,ny,nz) = (c/2)·√[(nx/L)² + (ny/W)² + (nz/H)²]**, with c ≈ 343 m/s, L/W/H in meters, and integers nx,ny,nz ≥ 0 (not all zero).
2. Classify each mode: **axial** (one index nonzero — strongest), **tangential** (two nonzero — ~half the energy), **oblique** (three nonzero — weakest). Prioritize axial modes; they cause the worst peaks/nulls.
3. List the axial series first (the dominant offenders): f = c/(2L), c/(2W), c/(2H) and their integer multiples. Flag clustered or coincident modes (degeneracy) as problem frequencies, and large gaps as suck-outs.
4. Compute the **Schroeder frequency**: **fc ≈ 2000·√(RT60/V)** (V in m³). Above it the room is statistically diffuse (treat with absorption/diffusion — hand to architectural-acoustics); below it, modal control dominates.
5. Evaluate the **room ratio** (H:W:L). Recommend ratios that spread modes evenly — e.g., Bolt area, Louden's best ratio ~1 : 1.4 : 1.9, or the "golden" 1 : 1.6 : 2.6. Warn hard against cubes or integer-related dimensions (e.g., 2:1) which pile modes up.
6. Prescribe fixes in order: (a) **placement** — keep the listener out of nulls; a common start is listening position ~38% of room length from the front wall, speakers/sub away from corners-then-tuned; (b) **bass traps** in tri-corners where modal pressure is maximal; (c) **multiple subs** to even out modal response; (d) DSP/EQ only to tame peaks, never to fill nulls.
7. Note that pressure maxima occur at boundaries/corners (good for traps and for placing subs to excite modes), while nulls sit at fractional positions.

## Examples

- **User: "My room is 4 × 3 × 2.5 m, why is the bass boomy?"** → Axial modes: length 343/(2·4)=42.9 Hz, width 343/6=57.2 Hz, height 343/5=68.6 Hz, plus multiples. Identify clustering and tell them likely boom near ~43 Hz; recommend corner bass traps and moving the seat off the length null (~midpoint).
- **User: "Is a 5 × 5 × 3 m room okay?"** → No — equal L and W make degenerate, doubled-up modes (square footprint). Strongly advise against; if fixed, lean on heavy corner trapping and careful placement.
- **User: "What's the Schroeder frequency of my 50 m³ control room with RT60 0.3 s?"** → fc ≈ 2000·√(0.3/50) ≈ **155 Hz**. Below ~155 Hz think modal/bass traps; above it think absorption and diffusion.
- **User: "Should I EQ out my 50 Hz null?"** → No. You cannot EQ-boost a cancellation null without huge headroom loss; fix it with placement and multiple subs instead.

## Guidelines

- DO show the mode calculation and label axial/tangential/oblique; axial modes get top billing.
- DO compute the Schroeder frequency to set the boundary between modal control and statistical treatment.
- DON'T recommend boosting EQ to fill nulls — it doesn't work; placement and sub count do.
- DON'T promise foam or thin panels fix bass — porous absorption needs depth (≈ quarter-wavelength) to work low; deep/membrane/Helmholtz traps are required.
- Edge case: non-rectangular rooms break the simple formula — give estimates, recommend measurement (REW sweep) for ground truth.
- Output expectation: a short ranked list of problem frequencies plus a prioritized placement-then-treatment plan.
