---
name: lighting-equipment
description: Use when the user asks what fixtures, consoles, rigging, power, or control gear a concert needs — triggers include "what lights should I buy/rent", "moving head vs PAR", "spot vs wash vs beam", "pick a console", "gear list", "truss and rigging", "how much power do I need". Covers fixture types, control surfaces, dimming/power, rigging, and atmospherics with selection guidance. NOT for laying out where gear goes (use concert-lighting-plan), DMX protocol/addressing (use dmx), or creative storytelling (use lighting-storytelling).
---

# Lighting Equipment

Concert lighting equipment falls into a few families: fixtures (the lights), control (consoles and software), power/dimming, rigging (truss, hoists, clamps, safeties), data distribution, and atmospherics. This skill helps Claude recommend the right gear for a show given budget, venue, and creative goals, and explain trade-offs between fixture types.

## Instructions
1. Establish the brief: venue size, budget (own vs rent), power available (amps/phases), crew skill, and the look the user wants (festival beams, theatrical washes, EDM strobe, etc.).
2. Recommend fixture types by job:
   - Wash (LED PAR, wash movers, battens/bars) — broad color fill, even coverage, band wash.
   - Spot / profile movers — sharp output, gobos, framing, iris; for key faces, mid-air gobo cones, and texture.
   - Beam movers — tight collimated beams for aerial looks in haze; minimal wash capability.
   - Hybrids (spot/beam/wash combos) — flexible when fixture count or budget is tight.
   - Strobes — white-light impact and hits.
   - Blinders / audience lights (e.g. 2-lite, 4-lite, 8-lite) — crowd-facing punch.
   - Conventionals (PAR cans, ACLs) — cheap warm tungsten looks, but need dimmers.
   - Pixel bars / battens — low-res video and chase effects.
3. Recommend control: a dedicated lighting console (grandMA, Avolites, ChamSys MagicQ, Hog) for complex moving-light shows; software + wing or DMX interface for small/budget shows. Match console channel/parameter capacity and busking features to the show.
4. Plan power and dimming: LED fixtures need constant power (no dimmer); conventional tungsten needs dimmer racks. Sum fixture wattage, divide across circuits/phases, and leave headroom. Specify power distro and cable.
5. Plan rigging: truss type and length, motors/hoists, clamps, safety cables/bonds, and weight loading. Note ground-support vs flown. Always include safeties on every fixture and accessory.
6. Plan data distribution: DMX/network runs, splitters/nodes, and an Art-Net/sACN backbone for large rigs (hand off protocol detail to the dmx skill).
7. Plan atmospherics: hazer (fine, even, long-hanging — best for beams) vs fogger (dense bursts); add fans for movement; confirm venue allows haze and won't trip smoke detectors.

## Examples
- "I'm starting a small band rig under $3k — what do I get?" → A handful of LED PAR washes, 2–4 budget spot/wash movers, a couple of blinders, a small hazer, a DMX interface + laptop or entry console, plus clamps, safeties, and a power strip plan within one circuit.
- "Spot vs beam vs wash — what's the difference?" → Wash = broad even color; spot/profile = sharp, gobos and framing for texture and faces; beam = tight aerial shafts that only read in haze; recommend by the look they're chasing.
- "Which console for a touring moving-light show?" → grandMA3, Avolites Diamond/Quartz, or ChamSys MagicQ depending on budget and crew familiarity; size by parameter count and need for timecode/busking.

## Guidelines
- Do match fixtures to their job — don't buy beams to do a wash, or washes to throw gobos.
- Do confirm LED vs tungsten power needs early; LEDs skip dimmers, conventionals require them.
- Do include rigging safeties, weight loading checks, and proper clamps on every flown item — non-negotiable.
- Do size the console to the parameter count and the show's control style (timecode vs live busking).
- Don't forget atmospherics: beams and back light are invisible without haze.
- Edge cases: noise-sensitive venues need quiet/no fans on movers and hazers; battery/wireless DMX fixtures help where cabling is impossible; outdoor shows need IP-rated fixtures and weather protection.
- Output a categorized gear list (fixtures, control, power, rigging, data, atmospherics) with quantities and a one-line rationale per item.
