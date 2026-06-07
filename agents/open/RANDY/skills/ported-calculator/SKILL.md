---
name: ported-calculator
description: Use when the user wants to design or compute a ported/vented (bass-reflex) enclosure — box volume, port tuning frequency (Fb), port diameter/length, or alignment choice. Triggers include "design a ported box", "what port length for Fb 35Hz", "calculate vent dimensions", "tune my sub box", "ported vs sealed for this driver". NOT for explaining T/S meaning (ts-explained) or wood/material choice (cabinet-materials).
---

# Ported / Vented Enclosure Calculator

This skill is RANDY's box-design engine for bass-reflex enclosures. Given a driver's T/S parameters, it determines an appropriate net internal volume (Vb), tuning frequency (Fb), and port geometry (diameter and length), then checks for port velocity (chuffing) and excursion safety below tuning.

## Instructions
1. Collect required inputs: Fs, Qts, Vas (essential); plus Sd, Xmax, Vd, and target Fb or response style. If missing, request them or pull via ts-database.
2. Choose an alignment: check EBP = Fs/Qes. EBP > ~100 favors ported. Common targets: a flat/maximally-flat (≈ Butterworth/QB3) or an extended-bass-shelf, or simply Fb ≈ Fs for many subs as a starting point.
3. Compute net volume Vb. For a quick start, vented Vb often falls near 1.5–2.5× the equivalent sealed volume; refine with alignment tables (e.g., for QB3, Vb and Fb derive from Qts and Vas).
4. Compute port. Use the vent-length formula:
   Lv = (23562.5 × Dv^2 × Nv) / (Fb^2 × Vb) − k × Dv
   where Lv = vent length (cm), Dv = vent inner diameter (cm), Nv = number of ports, Vb = net volume (liters), Fb = tuning (Hz), and k ≈ 0.732 (one flanged end) or 0.823 (both flanged). Adjust k for slot/flared ports.
5. Check port air velocity: keep peak velocity below ~17–20 m/s (lower for tuned/HiFi) to avoid chuffing; if too high, increase port area or use a flared/slot port, then recompute length.
6. Warn about excursion below Fb (driver unloads/over-excurts) and recommend a subsonic/high-pass filter when appropriate.
7. Subtract driver, port, and bracing displacement from gross to hit net Vb. State all assumptions and units.

## Examples
- "Design a ported box for Fs 28, Qts 0.36, Vas 70L." → Compute EBP, pick an alignment, give Vb, Fb, and a port (e.g., 4" diameter, length via formula), then velocity-check and suggest a subsonic filter.
- "Port length for a 50L box tuned to 35Hz with a 3-inch port?" → Plug Dv, Vb, Fb into Lv formula and return length, plus a chuffing check.
- "Ported or sealed for this driver?" → Use EBP and Qts to recommend, and offer a sealed alternative volume for comparison.

## Guidelines
- Always state Vb as NET internal volume and remind the user to add displacement for driver/port/bracing.
- Keep port velocity in check; recommend flares for high-output subs.
- Always recommend a subsonic filter for vented designs to protect excursion below Fb.
- Show the formula and your numbers so the user can verify; flag when a "rule of thumb" is being used vs a precise alignment.
- For final accuracy, recommend modeling in WinISD / VituixCAD / Hornresp.
- Reference: https://diamondaudiocity.com/speaker-tools/ported-enclosure-calculator/
