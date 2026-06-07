---
name: architectural-acoustics
description: Use when the question is about the acoustic behavior and treatment of a built space at and above the Schroeder frequency — reverberation, RT60/decay time, the Sabine and Eyring equations, absorption coefficients and NRC ratings, sound absorption vs diffusion, early reflections and flutter echo, sound isolation/transmission loss (STC, mass law, decoupling), HVAC noise (NC/NR), speech intelligibility (STI), and treating control rooms, live rooms, vocal booths, studios, theaters, or offices. Trigger on phrases like "reverb time", "RT60", "how much absorption do I need", "Sabine", "flutter echo", "soundproofing", "STC", "treat my room". This is GEDDY's broadband room-treatment skill — NOT for low-frequency standing waves (use room-modes) or the specific LEDE/dead-room philosophies (use led-design or dead-room).
---

# Architectural Acoustics

This skill lets GEDDY analyze and design the broadband acoustic response of a built space — how sound reverberates, reflects, transmits between rooms, and supports or harms intelligibility. It operates mainly in the statistical regime above the Schroeder frequency, where absorption, diffusion, and isolation rule. Use it to estimate reverberation, spec treatment, and plan isolation for studios, live rooms, and venues. Canonical reference: https://en.wikipedia.org/wiki/Architectural_acoustics

## Instructions

1. Anchor the analysis on **reverberation time RT60** — the time for sound to decay 60 dB after the source stops. Estimate it with the Sabine equation: `RT60 = 0.161 * V / A` (metric; V in m^3, A = total absorption in sabins = sum of surface area x absorption coefficient). Use the Eyring equation `RT60 = 0.161 * V / (-S * ln(1 - a_avg))` for live/well-absorbed rooms where average absorption is high (Sabine over-predicts there).
2. Target RT60 by use case: control/mix rooms ~0.2-0.4 s, live tracking rooms ~0.4-0.8 s (genre-dependent), vocal booths very dead ~0.1-0.2 s, conference/speech rooms ~0.5-0.8 s, concert halls ~1.8-2.2 s. State the target before prescribing treatment.
3. Work with **absorption coefficients** (alpha, 0-1 per octave band) and **NRC** (Noise Reduction Coefficient, the average of 250/500/1k/2k Hz). Remember absorption is frequency-dependent: thin porous panels kill highs but pass lows, so quote per-band behavior, not a single number.
4. Distinguish the tools: **absorption** removes energy (porous panels, mineral wool, broadband traps), **diffusion** scatters it to preserve liveness without flutter (QRD/skyline diffusers), and **reflection** control via geometry/angling. Solve **flutter echo** (the zing between parallel hard walls) with absorption or splaying/diffusion on one of the parallel pair.
5. Treat **early reflections** at the mirror points (side walls, ceiling, desk/console) for accurate stereo imaging in monitoring rooms — find them with the mirror trick from the listening position.
6. For **isolation** (keeping sound in or out), separate it from absorption (treatment inside a room does NOT soundproof it). Use the **mass law** (~6 dB transmission-loss gain per doubling of mass/surface density), **decoupling** (room-in-a-room, resilient channel, isolated studs), air gaps, and sealing. Spec with **STC** (airborne) and **IIC** (impact); address the bass weak point (mass law and STC understate low-frequency leakage).
7. Account for **HVAC/background noise** with NC/NR curves, and **speech intelligibility** with STI/%ALcons when the room is for talking.

## Examples

- User: "My 60 m^3 home studio echoes — how much treatment?" -> Pick a target (say 0.3 s mix room). Compute needed absorption: `A = 0.161 * 60 / 0.3 ~= 32 sabins`. Translate to panel area given panel NRC, distribute across first-reflection points and corners, and note bass needs depth (hand to room-modes for the modal range).
- User: "How do I stop the slap echo between my parallel walls?" -> That is flutter echo; break the parallel reflective path with absorption on one wall or a diffuser/splay. Treating just one of the two parallel surfaces is enough to kill it.
- User: "I added foam everywhere but the neighbors still hear my drums." -> Distinguish treatment from isolation: foam absorbs reflections inside the room, it does not block transmission. Isolation needs mass, decoupling, air gaps and airtight sealing per the mass law; STC ratings, not NRC.
- User: "What RT60 should a vocal booth have?" -> Very short, ~0.1-0.2 s, heavily and broadly absorbed (with attention to low-mid buildup in a small box), so the recorded voice is dry and the room signature is minimal.

## Guidelines

- Do state a target RT60 and use case before prescribing materials; treatment without a target is guesswork.
- Do quote absorption per frequency band and flag that thin porous material is highs-only.
- Do firmly separate ABSORPTION/treatment (room sound) from ISOLATION/soundproofing (transmission) — users constantly conflate them.
- Don't claim foam or carpet soundproofs a room, and don't promise the mass law fixes low-frequency leakage cheaply.
- Edge case: small rooms are modal below the Schroeder frequency where Sabine/RT60 statistics break down — hand the bass range to room-modes.
- Output: a target, a quick RT60 estimate, and a prioritized, band-aware treatment (or isolation) plan; recommend measurement (REW/sweep) to verify.
