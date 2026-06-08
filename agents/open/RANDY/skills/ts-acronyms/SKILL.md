---
name: ts-acronyms
description: Use when the user asks what a Thiele/Small acronym means, asks you to decode a driver spec sheet, or confuses two parameters (e.g. "what is Qts vs Qes", "what does Vas mean", "explain Xmax", "what is BL"). Translates raw T/S symbols into plain-language meaning and units, and flags which parameters drive RANDY's enclosure decisions. NOT for running enclosure-volume math (use enclosure-tuning-rule or the ported-calculator) and NOT for recommending a specific driver.
---

# Thiele/Small Acronym Decoder

A driver spec sheet is a wall of two- and three-letter symbols. This skill turns each symbol into a sentence a builder can act on, states the unit, and marks the handful of parameters that actually steer a cabinet decision. RANDY works in millimetres and litres; keep every answer in SI-friendly units.

## Instructions
1. Identify which symbol(s) the user named. If they pasted a whole spec sheet, decode every line present, top to bottom.
2. For each parameter give: full name, plain-language meaning, typical unit, and typical range for a pro/PA driver.
3. Always state the units explicitly. Vas in litres, Fs/Fb in Hz, Sd in cm^2 or mm^2, Xmax in mm, Vd in cm^3.
4. Flag the four decision drivers RANDY uses and tell the user why each matters: **Qts** (sealed vs ported gate at 0.4/0.45), **Qes** with **Fs** (EBP = Fs/Qes), **Vas** (sealed volume math), **Fs** (sets ported tuning Fb ~= Fs * 0.85).
5. If a parameter the user mentions is missing from a sheet, tell them how to derive it: EBP = Fs/Qes; Qts = (Qes*Qms)/(Qes+Qms); Vd = Sd * Xmax.
6. Never invent a numeric value for a specific driver. Decode the symbol; if they want numbers, ask for the sheet.

## Examples
- User: "What's the difference between Qts, Qes and Qms?" -> Explain Qms is mechanical Q (suspension/losses), Qes is electrical Q (motor/voice-coil damping), Qts is the parallel combination of both = the total resonance damping. State Qts is RANDY's first gate: < 0.4 leans ported, > 0.45 leans sealed.
- User: "My driver sheet says Vas 142 L, Fs 38 Hz, Qes 0.34, Qms 4.8 — decode it." -> Decode each, then note: Qts = (0.34*4.8)/(0.34+4.8) = 0.318, EBP = 38/0.34 = 112. Both say ported. Hand off to enclosure-tuning-rule for volumes.
- User: "What is BL and why do I care?" -> BL is the motor force factor (Tesla-metres): magnetic flux density times voice-coil length in the gap. Higher BL = stronger motor, tighter electrical damping, lower Qes.
- User: "What's Xmax?" -> Maximum linear one-way cone excursion in mm before the coil leaves the gap. Pairs with Sd to give displacement Vd = Sd * Xmax (sets clean low-end output).

## Guidelines
- Do decode the common set: Fs, Re, Le, Qms, Qes, Qts, Vas, Cms, Mms, Sd, BL, Xmax, Vd, EBP, Pe, SPL/sensitivity, Rms, n0.
- Do remind the user that Vas is an equivalent compliance volume, not a box size — it is an input to box math, never the box itself.
- Don't run the enclosure decision here beyond naming the gate; route volume math to the sibling skills.
- Edge case: some sheets give Cms (m/N) and Mms (g) instead of Vas. Note Vas = rho * c^2 * Sd^2 * Cms, and that for box work Vas is the figure you want.
- Output expectation: a clean labelled list, units on every number, decision drivers called out. Keep it tight, no filler.
- Canonical reference: https://www.midbass.com/how-to-understand-ts-parameters-2/
