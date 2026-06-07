---
name: thiele-small-foundations
description: Use when the user asks about Thiele/Small parameters, driver electromechanical specs, or how a loudspeaker driver's measured parameters predict low-frequency behavior. Triggers include "Thiele Small", "T/S parameters", "Fs", "Qts", "Vas", "BL", "Mms", "Cms", "Sd", "Xmax", "what do these driver specs mean for enclosure design". NOT for picking a final box volume/tuning (use ported-calculator) or for cabinet wood choices (use cabinet-materials).
---

# Thiele/Small Foundations

The Thiele/Small (T/S) parameters are the set of measured electromechanical values that describe how a moving-coil loudspeaker driver behaves in the low-frequency, small-signal region. Named after Neville Thiele and Richard Small, they let a designer predict in-box response, required enclosure volume, and port tuning before cutting any wood. This skill grounds RANDY's reasoning about what each parameter means and how they interrelate.

## Instructions
1. When asked what a parameter means, give the symbol, unit, and a plain-language meaning, then note its design impact. Use the canonical set below.
2. Identify the three categories: small-signal (linear behavior at low drive), large-signal (excursion/power/thermal limits), and fundamental physical constants of the driver.
3. Explain key relationships when relevant: Qts is the parallel combination of Qes and Qms (1/Qts = 1/Qes + 1/Qms); Vas is the compliance expressed as an equivalent air volume; Fs and Qts together drive the EBP (Efficiency Bandwidth Product = Fs/Qes) used to suggest sealed vs ported.
4. When a user gives partial specs, tell them which missing parameters are needed for the calculation they want, and hand off to ported-calculator or sealed-box math once volume/tuning is the goal.
5. Always flag that manufacturer T/S specs drift after break-in and vary unit-to-unit; recommend measuring (e.g., added-mass or known-volume method via DATS/REW) for critical builds.

## Canonical parameters
- Fs (Hz): free-air resonance frequency of the driver. Lower = better deep bass potential.
- Re (ohms): DC resistance of the voice coil. Typically ~80% of nominal impedance.
- Le (mH): voice-coil inductance; affects high-frequency rolloff.
- Qes: electrical Q at Fs (damping from the motor/amp). 
- Qms: mechanical Q at Fs (damping from suspension losses).
- Qts: total Q at Fs; combines Qes and Qms. Guides alignment choice.
- Vas (liters or ft^3): equivalent compliance volume — the air volume with the same springiness as the driver's suspension. Larger Vas = looser suspension = needs bigger box.
- Cms (mm/N): mechanical compliance of the suspension (inverse stiffness).
- Mms (g): moving mass including air load (cone, coil, former, air).
- BL (T·m): force factor — motor strength (flux density × coil length).
- Sd (cm^2 or m^2): effective radiating cone area.
- Xmax (mm): peak linear excursion; large-signal limit for clean output.
- Pe (W): thermal power handling.
- EBP = Fs/Qes: rule-of-thumb alignment indicator (<50 leans sealed, ~50-100 either, >100 leans ported).
- η0 / SPL sensitivity (dB @ 1W/1m): reference efficiency.

## Examples
- "What does Qts of 0.38 tell me?" → Explain Qts is total damping at resonance; ~0.3-0.4 is a versatile value suiting ported alignments, lower (≈0.2) prefers ported with EQ, higher (≈0.7) suits sealed acoustic-suspension. Recommend checking EBP too.
- "My driver has Fs 35Hz, Vas 60L, Qts 0.4 — is this a sub?" → Confirm parameters point to a capable low-frequency driver, compute EBP if Qes given, and offer to move to ported-calculator for a tuned box.
- "Difference between Qes and Qms?" → Qes = electrical damping via the motor; Qms = mechanical damping via suspension losses; they combine into Qts.

## Guidelines
- Always state units; never quote a Q with units (Q is dimensionless).
- Don't invent a driver's parameters — ask for the datasheet or measured values.
- Distinguish small-signal (Fs, Qts, Vas) from large-signal (Xmax, Pe) limits when a user conflates "goes low" with "goes loud."
- Treat published specs as nominal; recommend measurement for crossover/alignment-critical work.
- Reference: https://en.wikipedia.org/wiki/Thiele/Small_parameters
