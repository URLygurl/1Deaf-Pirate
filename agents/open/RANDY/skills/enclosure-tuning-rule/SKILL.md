---
name: enclosure-tuning-rule
description: Use when the user has T/S parameters and wants RANDY to decide sealed vs ported AND size the box — "should this driver go sealed or ported", "what volume box does this need", "what Fb should I tune to", "calculate Vb for Qtc 0.707". Applies RANDY's decision gates and the closed-form sealed/ported sizing math, in litres and millimetres. NOT for decoding what an acronym means (use ts-acronyms) and NOT for bracing or material choice.
---

# Enclosure Decision and Tuning Rule

Given a driver's Thiele/Small parameters, this skill picks the alignment (sealed or ported) using RANDY's gates, then sizes the enclosure with closed-form math. Everything in litres for volume and Hz for frequency; convert to a box in millimetres at the end.

## Instructions
1. Collect the needed inputs: Qts, Qes, Fs, Vas. If any are missing, ask for them or derive (Qts from Qes & Qms; EBP from Fs & Qes).
2. Apply the alignment gates and state both signals:
   - **Qts gate:** Qts < 0.4 -> ported; Qts > 0.45 -> sealed; 0.4-0.45 -> either, decide on use case (ported for max low-end SPL/PA, sealed for tight transient/monitor).
   - **EBP gate:** EBP = Fs / Qes. EBP > 100 -> ported; EBP < 50 -> sealed; 50-100 -> either.
3. When the two gates agree, state the verdict plainly. When they disagree, say so and break the tie with the user's intent (touring SL>output vs monitor accuracy).
4. **Ported sizing:** tune Fb ~= Fs * 0.85. Box volume Vb scales with Vas (typical vented box ~0.7-1.4 * Vas for these alignments); state the target Fb and the chosen Vb. Then size the port for Fb.
5. **Sealed sizing:** pick a target Qtc (0.707 = maximally flat Butterworth; 0.8-1.0 = punchier, smaller box). Compute Vb = Vas / ((Qtc/Qts)^2 - 1). Report the resulting system Fc = Fs * (Qtc/Qts).
6. Convert the net internal volume to external millimetre dimensions: add back driver/port/bracing displacement, then add the panel thickness (18 mm) per side to get outside dimensions. State internal AND external dims.
7. Note the material follow-on: ported/touring -> 13-ply Baltic birch 18 mm; stationary monitor -> MDF 18 mm (route to cabinet-materials for detail).

## Examples
- User: "Qts 0.32, Qes 0.34, Fs 38, Vas 142 L — sealed or ported and what size?" -> EBP = 112, Qts 0.32: both say ported. Fb = 38 * 0.85 = 32.3 Hz. Pick Vb ~ Vas-ish, size port to 32 Hz, give net + external mm.
- User: "Qts 0.48, Fs 52, Vas 28 L, want a flat sealed monitor." -> Qts > 0.45 confirms sealed. Qtc 0.707: Vb = 28 / ((0.707/0.48)^2 - 1) = 28 / (2.169 - 1) = 28 / 1.169 = 23.9 L. Fc = 52 * (0.707/0.48) = 76.6 Hz. MDF 18 mm.
- User: "Qts 0.42, EBP 70 — what do I do?" -> Both gates land in the grey band. Ask intent: PA/SPL -> ported Fb ~= Fs*0.85; tight near-field monitor -> sealed Qtc 0.707.
- User: "What Qtc gives me a Butterworth response?" -> Qtc = 0.707, maximally flat, no peaking; smaller Qtc rolls off earlier, larger Qtc adds a bump and shrinks the box.

## Guidelines
- Do show the arithmetic so the user can audit it; do state Vb in litres and the final box in millimetres.
- Do report Fb (ported) or Fc and Qtc (sealed) every time — a volume with no tuning is half an answer.
- Don't pretend the gates are laws; when Qts and EBP disagree, surface the conflict and decide on use case.
- Edge case: very high Qts (> 0.6) drivers want free-air or large sealed; warn that a small box will over-damp and kill low end.
- Edge case: a sealed Vb math result that is negative or huge means Qtc <= Qts is impossible — Qtc must exceed Qts; flag it.
- Output expectation: alignment verdict, both gate values, net volume (L), tuning (Fb or Fc/Qtc), external dims (mm), material handoff.
- Canonical reference: https://www.conversionandcalculation.com/calculators/audio/speaker-enclosure/
