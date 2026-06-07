---
name: acoustics-foundations
description: Use when the user asks about the physics of sound — sound waves, frequency, wavelength, period, the speed of sound, decibels and the dB scale, reflection, absorption, diffraction, refraction, interference, resonance, or the subfields of acoustics (architectural, environmental, underwater, bioacoustics, ultrasonics). Trigger on phrases like "how does sound work", "what is a decibel", "calculate wavelength", "speed of sound", "sound intensity", "what is acoustics". This is the GEDDY foundations skill — NOT for perception/hearing questions (use psychoacoustics) or room-specific design (use architectural-acoustics or room-modes).
---

# Acoustics Foundations

This skill gives GEDDY the core physics of sound: how acoustic waves propagate, the quantities that describe them, and the wave behaviors (reflection, absorption, diffraction, interference, resonance) that underlie every downstream acoustics task. It is the grounding layer the other GEDDY skills build on. Canonical reference: https://en.wikipedia.org/wiki/Acoustics

## Instructions

1. Anchor every answer in the wave equation reality: sound is a longitudinal pressure wave needing a medium. Relate frequency (f), wavelength (λ), and speed (c) with **c = f·λ**.
2. Use the standard speed of sound in air ≈ **343 m/s at 20°C** (≈ 1125 ft/s). For other media or temperatures, state the dependency: c rises ~0.6 m/s per °C in air, and is much higher in water (~1480 m/s) and steel (~5000 m/s).
3. When computing wavelength, show the arithmetic: λ = c/f. Example: 100 Hz → 343/100 = 3.43 m; 1 kHz → 0.343 m; 10 kHz → 3.43 cm.
4. Explain decibels correctly. Sound pressure level **Lp = 20·log10(p/p0)** dB, with reference p0 = 20 µPa. Sound intensity/power level uses **10·log10**. State that +6 dB ≈ doubling of pressure, +10 dB ≈ perceived "twice as loud," and +3 dB ≈ doubling of intensity/power.
5. Identify the relevant wave behavior for the question: reflection (angle in = angle out), absorption (energy → heat in porous/resonant material), diffraction (bending around obstacles, strong when obstacle ≈ λ), refraction (bending through gradients), interference (constructive/destructive), and resonance/standing waves.
6. Name the right subfield so the user can go deeper: architectural, environmental/noise, musical, underwater (sonar), ultrasonics/infrasonics, bioacoustics, psychoacoustics, vibration/structural.
7. Keep units explicit (Hz, m, dB, Pa, m/s) and show formulas before plugging numbers.

## Examples

- **User: "What's the wavelength of a 60 Hz hum?"** → Apply λ = c/f = 343/60 ≈ **5.7 m**. Note this is why low-frequency problems are hard to treat — the wavelength is room-sized.
- **User: "If I double the distance from a speaker, how much quieter?"** → Inverse-square law for a point source in free field: **−6 dB per doubling of distance**. Caveat that real rooms add reflections so the drop is less.
- **User: "Why does sound bend around corners but light doesn't?"** → Diffraction scales with λ vs obstacle size. Audible wavelengths (cm to meters) are comparable to everyday objects, so sound diffracts readily; visible light's wavelength is sub-micron.
- **User: "Is 90 dB twice as loud as 80 dB?"** → No. +10 dB is ~2× perceived loudness; it is 10× the intensity. Clarify pressure vs intensity vs perceived loudness.

## Guidelines

- DO show formulas and units; DO sanity-check magnitudes (a 20 Hz wave is ~17 m long, a 20 kHz wave ~1.7 cm).
- DO distinguish the three "loudness" framings: SPL (physical), intensity (physical), perceived loudness (psychoacoustic — hand off to psychoacoustics).
- DON'T conflate the 10·log and 20·log decibel forms; pressure uses 20·log, power/intensity uses 10·log.
- DON'T treat air's speed of sound as fixed — temperature and medium matter; state assumptions.
- Edge case: in a vacuum there is no sound. In solids, both longitudinal and transverse (shear) waves propagate.
- Output expectation: concise, formula-first, with one worked number when a calculation is implied.
