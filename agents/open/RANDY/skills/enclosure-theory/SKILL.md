---
name: enclosure-theory
description: Use when the user asks how loudspeaker enclosures work or which enclosure type to use — sealed, ported, bandpass, transmission line, infinite baffle, horn — and the tradeoffs between them. Triggers include "sealed vs ported", "what is a bandpass box", "transmission line", "why do speakers need a box", "baffle / baffle step", "open baffle", or "which enclosure type for my driver". This is the conceptual enclosure skill. It is NOT for crunching port/box numbers (use ported-calculator), NOT for materials/joinery (use cabinet-materials), and NOT for shipping cases (use road-case-theory).
---

# Loudspeaker Enclosure Theory

This skill explains why drivers need enclosures and how each enclosure topology shapes the result. A bare driver suffers an acoustic short circuit — front and rear waves are out of phase and cancel at low frequencies. The enclosure manages the rear wave; the topology you pick trades extension, efficiency, transient accuracy, size, and complexity.

## Instructions
1. Establish the core problem first: the rear radiation must be controlled or the bass cancels (the dipole short-circuit). The enclosure is how you do that.
2. Walk the main topologies and their tradeoffs:
   - **Sealed (acoustic suspension):** simplest; smooth 12 dB/octave rolloff; best transient/group-delay behavior and deepest-loading control; less efficient and less deep extension for a given size. Likes higher-Qts drivers.
   - **Ported (bass-reflex):** vent reinforces output near tuning, +3–6 dB extension and efficiency; steeper 24 dB/octave rolloff below Fb and worse damping/transients there; risk of unloading below tuning. Likes lower-Qts drivers.
   - **Bandpass (single/dual reflex):** driver fires into chambers; high efficiency over a narrow band, built-in filtering, but bulky, hard to design, and limited bandwidth.
   - **Transmission line:** long damped/tapered tube loads the rear wave; deep, well-damped bass, but large and finicky to tune.
   - **Infinite baffle / sealed-large:** driver sees effectively infinite volume; very natural rolloff, needs a large baffle or sealed space.
   - **Open baffle / dipole:** no rear enclosure; open, room-friendly midbass but limited deep bass and needs big baffles + EQ.
   - **Horn:** acoustic transformer for very high efficiency and pattern control; large and bandwidth/throat-dependent.
3. Address **baffle step**: as wavelength approaches baffle width, radiation transitions from half-space to full-space, costing up to ~6 dB low end; compensate with baffle-step EQ or driver placement.
4. Map the driver to the topology using Qts/Vas/Fs (low Qts → ported; high Qts → sealed) and the user's priorities (size, deepest bass, transient accuracy, efficiency).
5. Recommend a topology, state the tradeoff being accepted, then hand precise volume/port numbers to ported-calculator.

## Examples
- User: "Why can't I just use the driver without a box?" → Explain the dipole short circuit and how an enclosure stops front/rear cancellation.
- User: "Sealed vs ported for a home sub?" → Sealed = tighter, smaller, smoother rolloff; ported = deeper and louder for the size with steeper rolloff and unloading risk; choose by room and music.
- User: "What's a bandpass box good for?" → High efficiency over a narrow band (car/PA SPL), at the cost of size and bandwidth.
- User: "My speaker is thin in the lower mids." → Likely baffle step; explain and suggest BSC EQ or baffle-width/placement fixes.

## Guidelines
- Always name the tradeoff you're accepting; no topology is free.
- Tie the recommendation back to the driver's T/S and the user's stated priority.
- Don't over-recommend transmission lines/horns for casual builds — they're large and exacting.
- Hand off quantitative design to ported-calculator and material/bracing to cabinet-materials.
- Canonical reference: https://en.wikipedia.org/wiki/Loudspeaker_enclosure
