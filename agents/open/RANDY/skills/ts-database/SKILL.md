---
name: ts-database
description: Use when the user needs to look up, organize, compare, or store Thiele/Small parameters for specific drivers, or wants a reference/database approach to driver specs. Triggers include "look up T/S for [driver]", "compare these two drivers' specs", "build a spec sheet", "where can I find T/S parameters", "what's a typical Vas for a 12 inch sub". NOT for explaining what a parameter means (ts-explained) or computing a box (ported-calculator).
---

# T/S Database & Driver Spec Reference

This skill is RANDY's reference-and-comparison mode: sourcing, validating, and structuring Thiele/Small data for specific drivers so it can feed enclosure design. It covers where credible T/S data lives, how to read a manufacturer datasheet, how to normalize units, and how to compare candidate drivers head-to-head.

## Instructions
1. When asked for a specific driver's T/S, ask for make/model and size, then source from: the manufacturer's official datasheet first, then reputable community databases (e.g., speakerdesign.dev, Parts Express specs, loudspeakerdatabase.com), and clearly label any figure as nominal vs measured.
2. Normalize units before comparing: Vas in liters, Sd in cm^2 (or m^2), Fs in Hz, Xmax in mm (note one-way vs peak-to-peak conventions), and confirm Qts is dimensionless.
3. When comparing drivers, build a side-by-side table of Fs, Qts, Vas, Sd, Xmax, Pe, sensitivity, Re, and EBP (Fs/Qes), and call out which suits sealed vs ported.
4. Flag suspicious or inconsistent specs (e.g., Qts that doesn't reconcile with Qes/Qms, or Vas implausible for the cone size) and recommend measurement.
5. Hand off chosen parameters to ported-calculator or sealed-box math; never let a database lookup be the end of the design.

## Typical ballparks (sanity-check only, not lookups)
- 6.5" midbass: Fs ~45-60 Hz, Vas ~10-25 L, Qts ~0.3-0.5.
- 12" subwoofer: Fs ~20-35 Hz, Vas ~40-120 L, Qts ~0.3-0.5, Xmax ~10-20 mm.
- 15" PA woofer: Fs ~35-50 Hz, Vas ~100-250 L, high sensitivity (~96-99 dB), modest Xmax.

## Examples
- "Find T/S for a Dayton Audio RS270." → Ask to confirm model, point to manufacturer datasheet and speakerdesign.dev, present a normalized spec table, note nominal status.
- "Compare these two 12s for a ported sub." → Build a comparison table, compute EBP for each, recommend the better ported candidate and explain why.
- "Is Vas of 5L realistic for a 15-inch woofer?" → No — flag as implausibly stiff; suggest re-checking source or measuring.

## Guidelines
- Always cite the source of any quoted spec and mark nominal vs measured.
- Never fabricate a driver's parameters; if unknown, say so and recommend measurement (DATS/REW added-mass method).
- Watch unit traps: Xmax one-way vs Xmax(p-p), Sd in cm^2 vs m^2, Vas in L vs ft^3.
- Output structured tables for comparisons; keep provenance attached.
- Reference: https://speakerdesign.dev/thiele-small-parameters
