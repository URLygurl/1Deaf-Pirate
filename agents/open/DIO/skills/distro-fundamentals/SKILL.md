---
name: distro-fundamentals
description: Use when the user asks about power distribution hardware and topology for a show — distro boxes, three-phase vs single-phase splits, breakers/RCBOs, feeder cable, connectors (powerCON, CEE/IEC 60309, camlock), tails, and how power is broken out from a supply to fixtures. Triggers on "distro", "distribution box", "three-phase breakout", "feeder cable", "camlock", "CEE plug", "power distribution for stage". NOT for load math (use lighting-power-calc) and NOT for high-level safety theory (use stage-power-basics). Concept and selection guidance only — installation and connection are electrician work.
---

# Stage Electrics & Distro Fundamentals

How power gets from an incoming supply (mains intake or generator) out to all the gear on a stage. Covers the distribution chain — source → main distro → sub-distros → circuits → fixtures — and the hardware that makes it safe and orderly: breakers/RCBOs, feeder/tails, and the connector families used at each stage. Understanding distro lets production people plan a clean, safe power layout and brief an electrician precisely, without attempting to wire or connect it themselves.

## Instructions
1. Map the distribution chain top-down: incoming supply → main distro (the breakout point) → sub-distros if needed → individual protected circuits → fixtures. Keep it a tree, not a tangle.
2. Clarify single-phase vs three-phase. A three-phase distro takes one 400 V (NZ/AU/EU) feed and breaks it into multiple 230 V single-phase circuits across L1/L2/L3. Stress balancing fixtures across phases (see lighting-power-calc).
3. Explain protection in the distro: every outgoing circuit should be breaker-protected and RCD/RCBO-protected. RCBOs combine overcurrent + earth-fault protection per circuit — preferred for stage breakouts.
4. Cover the connector families and where each belongs: IEC 60309 (CEE) blue 16 A/32 A single-phase and red 3-phase 16 A/32 A/63 A for feeders and circuits; camlock/powerlock for large feeder tails; powerCON/TRUE1 and 13 A/15 A local outlets at the fixture end. Match connector to current rating and never adapt up.
5. Talk feeder/tails: the heavy cable from supply to distro must be correctly rated and sized for the current and run length; oversized for voltage drop on long runs. This sizing is the electrician's call — provide the load figure, not the wire spec.
6. Address layout and housekeeping: short clean runs, cable protection over walkways, distro kept dry and off wet ground, clear labelling of circuits, and accessible breakers for fast isolation.
7. Always frame distro design as planning. Connecting a distro to a supply, making off tails, and energising belongs to a licensed/registered electrician (EWRB in NZ) working to AS/NZS 3000.

## Examples
- User: "We've got a 63 A three-phase CEE supply — how do we break it out to our rig?" → Describe a 63 A 3-phase main distro splitting to balanced 230 V 16 A/32 A circuits with RCBO protection, balanced across L1/L2/L3, and note an electrician makes the supply connection.
- User: "What's the difference between camlock and CEE connectors?" → CEE/IEC 60309 are standardised pin-and-sleeve plugs for 16–125 A circuits and feeders; camlock/powerlock are single-pole high-current connectors for big feeder tails. Explain typical use and that ratings must match.
- User: "Can I just daisy-chain power boards from one socket for the stage?" → No — explain why that overloads and removes proper protection, and describe a small distro with individually protected RCBO circuits as the correct approach.
- User: "How should I lay out distro for a two-band stage?" → Suggest a main distro near the supply, balanced circuits per area, protected outlets at fixture positions, labelled circuits, protected cable runs, and electrician sign-off.

## Guidelines
- Do present distro as a clean protected tree with per-circuit RCD/RCBO protection and balanced phases.
- Do match connectors to current ratings and explain feeder sizing depends on current and run length.
- Don't tell an unqualified person to make off tails, wire connectors onto feeders, connect a distro to the supply, or energise it — that's licensed electrician work under AS/NZS 3000 (EWRB-registered in NZ).
- Don't recommend domestic power boards or adaptors as distribution; they lack the protection and rating.
- Edge cases: generator feeds need correct earthing/bonding at the source; long feeder runs need voltage-drop allowance; outdoor distro needs IP-rated enclosures and weather protection.
- Output expectation: a clear topology, protection scheme, and connector/feeder plan the user can hand to an electrician — never an instruction to perform the connection.

Canonical reference: https://www.onstagelighting.co.uk/learn-stage-lighting/stage-electrics-lighting-distro-for-dummies/
