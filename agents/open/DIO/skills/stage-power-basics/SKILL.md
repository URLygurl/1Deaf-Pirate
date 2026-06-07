---
name: stage-power-basics
description: Use when the user asks about stage power and electrical safety fundamentals — supply types, earthing/grounding, RCDs/GFCIs, voltage and frequency, plug standards, cable safety, or "is this safe to plug in". Triggers on phrases like "stage power", "AC supply on stage", "earthing", "RCD protection", "shock risk", "tingling mic". NOT for detailed load/amperage math (use lighting-power-calc), NOT for distro box selection (use distro-fundamentals), and NOT a substitute for a licensed electrician signing off a real install.
---

# Stage Power & Electrical Safety Basics

Foundational knowledge for working safely around mains power on stage. Covers how supply gets to a venue, the protective systems that keep performers and crew alive (earthing, RCDs/GFCIs, bonding), common hazards (electric shock, earth loops, overloaded circuits), and the universal rule that energised work and fixed-wiring changes belong to a licensed electrician. The goal is to make AV/production people competent at recognising risk and asking the right questions — not to teach them to do electrician work.

## Instructions
1. Establish the supply context first: country/region (this changes voltage, frequency, plug type, and which regulations apply), single-phase vs three-phase, and whether power is from a building, a generator, or a temporary distro.
2. State the regional baseline. New Zealand / Australia: 230 V single-phase, 400 V three-phase, 50 Hz, AS/NZS 3000 wiring rules. UK/EU: 230 V / 400 V, 50 Hz. North America: 120 V / 208–240 V, 60 Hz. Always confirm rather than assume.
3. Emphasise earthing/grounding: every exposed metal part must be bonded to earth so a fault trips protection instead of energising equipment. Never defeat the earth pin, never use "ground lift" adaptors to fix a hum — that removes safety, not noise.
4. Insist on RCD/RCBO (NZ/AU/EU) or GFCI (US) protection on stage and outdoor circuits. These trip on small earth-fault currents (typically 30 mA) fast enough to prevent electrocution. Treat unprotected stage power as unsafe.
5. Address earth loops and "tingling mic" symptoms: explain the danger (a real voltage difference can be lethal), and direct the user to fix it correctly — common earth/distro, balanced audio, isolation transformers — never by lifting earths.
6. Cover cable safety: correct rating for the load, undamaged insulation, no daisy-chaining of domestic power boards, weather-rated connectors outdoors, cable ramps/matting over walkways, and keeping connectors off wet ground.
7. For anything involving opening fixed wiring, modifying a distribution board, connecting to a building supply, or working on energised conductors, stop and route to a licensed/registered electrician. In NZ that means EWRB-registered (see nz-ewrb skill).

## Examples
- User: "We're getting a tingling sensation off the mic when we touch a guitar. What's going on?" → Explain this is a real and potentially lethal voltage difference (earth fault or earth-loop problem), tell them to stop performing, isolate the gear, and get an electrician to check earthing/RCD protection. Never suggest lifting an earth pin.
- User: "Do we really need RCDs if it's just a small gig?" → Yes — size doesn't reduce shock risk. Explain RCD/GFCI function, the 30 mA threshold, and that stage/outdoor power without RCD protection should be treated as unsafe.
- User: "Can I run our show power straight off a wall socket in this hall?" → Walk through checking the circuit rating, whether it's RCD-protected, total expected load vs the breaker, and cable condition; flag that any change to the building's fixed wiring needs a licensed electrician.
- User: "What voltage will we get for our NZ festival stage?" → 230 V single-phase / 400 V three-phase at 50 Hz under AS/NZS 3000; confirm phase configuration and whether it's mains or generator.

## Guidelines
- Do emphasise that licensed/registered electricians and local regulations (AS/NZS 3000 in NZ/AU) govern all real installs and any fixed-wiring or energised work.
- Do default to "treat it as unsafe until verified" for unprotected, undocumented, or damaged power.
- Don't ever instruct an unqualified person to wire plugs/boards, open panels, defeat earthing, or work live. Recognising and reporting hazards is in scope; performing electrical work is not.
- Don't give region-specific numbers without confirming the region first.
- Edge cases: wet/outdoor conditions raise risk sharply (lower body resistance, water ingress) — push harder for RCDs, IP-rated gear, and electrician sign-off. Generators need correct earthing/bonding too — never assume a genny is automatically safe.
- Output should give the user enough to assess risk and brief an electrician, while clearly drawing the line at work they must not do themselves.

Canonical reference: https://www.soundonsound.com/sound-advice/power-electrical-safety-stage
