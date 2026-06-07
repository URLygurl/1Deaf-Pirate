---
name: led-design
description: Use when the question is about Live End Dead End (LEDE) control-room design or the related Reflection-Free Zone (RFZ) concept — making the front of a mixing/monitoring room absorptive (the dead end around the speakers and engineer) while keeping the rear live with diffusion. Trigger on phrases like "LEDE", "live end dead end", "reflection-free zone", "RFZ", "how should I treat my control room", "dead front live back", "monitoring room design", "where do I put absorption vs diffusion". This is GEDDY's control-room layout philosophy skill — it is about ROOM ACOUSTICS DESIGN, NOT LED lighting. It is NOT for general RT60 math (use architectural-acoustics), low-frequency modes (use room-modes), or fully dead spaces (use dead-room).
---

# Live End Dead End (LEDE) Design

This skill grounds GEDDY in Live End Dead End control-room design and the Reflection-Free Zone it creates. LEDE makes the front of the room (around the monitors and the engineer's head) acoustically dead so that the first sound to reach the ears is the direct, uncolored signal from the speakers, while the rear of the room stays live with diffusers to preserve a sense of space and a smooth, decorrelated decay. Use it to lay out and treat a mixing/monitoring room. Canonical reference: https://hofa-akustik.de/en/blog-en/room-acoustics-live-end-dead-end-explained/

## Instructions

1. State the core goal: deliver the **direct sound first and cleanest** to the mix position, suppressing strong early reflections that would comb-filter the response and smear the stereo image, while keeping enough later, diffuse energy that the room sounds natural rather than oppressive (the failure mode of a fully dead room — see dead-room).
2. Lay out the room: **dead end at the FRONT** (the speaker/listening end), **live end at the REAR**. Place broadband absorption on the front wall, side walls, and ceiling around the speakers and the first-reflection (mirror) points; keep the rear wall live with **diffusion** (and some absorption/bass control as needed).
3. Build the **Reflection-Free Zone (RFZ)** around the engineer's head: angle/treat front surfaces and position monitors so that no strong reflection arrives within roughly the first **~15-20 ms** after the direct sound. This exploits the precedence/Haas effect (hand to psychoacoustics) so the brain locks onto the direct sound and the room's later energy is perceived as ambience, not coloration.
4. Find and kill the **early-reflection points** with the mirror trick from the listening position (side walls, ceiling, console/desk bounce). Absorb these first — they are the highest-priority surfaces.
5. Use **diffusion** at the rear (and optionally rear-side) to scatter the returning energy into a dense, decorrelated, delayed field. The aim is a smooth reverberant tail with no discrete slap back to the desk, preserving liveness and spaciousness without distinct echoes.
6. Treat **low frequencies separately**: LEDE governs early reflections (mids/highs), but bass needs corner traps and modal control regardless of the live/dead layout — hand the modal range to room-modes and broadband RT60 targets to architectural-acoustics.
7. Sanity check against alternatives: note LEDE is one established philosophy (alongside RFZ-centric and Non-Environment designs). The unifying principle across all of them is a reflection-free listening zone with controlled, diffuse later energy.

## Examples

- User: "How should I treat my control room with LEDE?" -> Dead front, live rear: broadband absorption on front wall, ceiling cloud, and first-reflection mirror points; diffusers on the rear wall; corner bass traps. Build an RFZ at the mix seat so the first reflections arrive after ~15-20 ms.
- User: "Where do diffusers go in a mixing room?" -> Primarily the rear (live end) to scatter returning energy into a smooth, decorrelated tail; not at the front, where you want absorption to keep early reflections off the engineer.
- User: "What's the reflection-free zone?" -> A zone around the listening position kept free of strong early reflections (first ~15-20 ms) via absorption and monitor geometry, so the brain locks to the direct sound (precedence effect) and the room's later diffuse energy reads as ambience.
- User: "Is LEDE the same as making the room dead?" -> No. LEDE deliberately keeps a LIVE rear with diffusion; a fully dead room is fatiguing and removes useful spaciousness. LEDE balances a dead front against a diffuse-live back.

## Guidelines

- Do clarify immediately that LEDE = Live End Dead End room acoustics design, not LED lighting.
- Do put absorption at the FRONT/early-reflection points and diffusion at the REAR; getting this backwards defeats the design.
- Do tie the reflection-free window (~15-20 ms) to the precedence/Haas effect and image accuracy.
- Don't let LEDE substitute for bass treatment — modes and low-frequency decay need dedicated traps regardless.
- Don't over-deaden: the live end is intentional; a symmetric, fully absorbed room is a different (and usually worse) choice for monitoring.
- Edge case: small or oddly shaped rooms may not support a textbook live end; prioritize the RFZ at the desk and measure (REW) to verify the early-reflection window.
- Output: a front-dead / rear-live layout, mirror-point absorption priorities, rear diffusion, and a note to handle bass and RT60 via the sibling skills.
