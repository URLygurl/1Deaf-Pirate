---
name: guitar-electrics-fix
description: Use this when a guitar's onboard electronics misbehave — scratchy or dead pots, crackling pickup selector switches, intermittent output jacks, hum, ground issues, or a pickup that's gone silent. Trigger on phrases like "my volume knob crackles," "guitar cuts out when I move the switch," "loose output jack," "guitar hums unless I touch the strings," or "one pickup stopped working." This is for the guitar's internal wiring, controls, and jack — NOT for amplifier internals (see amp-first-aid) or for cables (see cable-repair).
---

# Guitar Electrics Fix

This skill diagnoses and repairs the passive electronics inside an electric guitar: potentiometers (volume/tone), capacitors, pickup selector switches, the output jack, pickup leads, and the grounding/shielding scheme. Most "my guitar is broken" complaints trace to a handful of cheap, fixable culprits — a dirty pot, a loose jack nut, a cold solder joint, or a broken ground wire. Work methodically from the most likely and least invasive cause outward.

## Instructions
1. Reproduce the fault and localize it: wiggle each control, rock the selector switch, and flex the cable at the jack while listening. Note exactly which action triggers the noise or dropout — that points to the component.
2. For scratchy/crackly pots, treat with a quality contact cleaner (e.g. DeoxIT) sprayed into the pot opening, then rotate the shaft fully back and forth ~20 times to work it in. Avoid generic WD-40.
3. For an intermittent or dead output, check the jack first: a spun/loose jack nut twists the internal wires. Tighten the nut while holding the jack body still, and inspect for a cracked solder joint on the tip (hot) and sleeve (ground) lugs.
4. For switch crackle or dead positions, clean the switch contacts with contact cleaner and actuate it repeatedly; inspect for cold joints or a lead that has fatigued and broken at the lug.
5. Trace grounding issues: excess hum that quiets when you touch the strings usually means a broken bridge/string ground or unshielded cavity. Verify continuity from bridge to the back of a pot with a multimeter (should read near 0 ohms).
6. Resolder any cold or broken joints: heat the lug, flow fresh rosin-core solder for a shiny concave fillet, and keep wires dressed away from shorting against adjacent lugs or the cavity shielding.
7. Verify with a multimeter where useful: pot taper sweep, pickup DC resistance (typically ~6k–16k ohms depending on type — an open reading means a broken coil or lead), and continuity of ground paths.
8. Reassemble, retest every control through an amp, and confirm the fault is gone before closing the cavity.

## Examples
- User: "My volume knob makes a scratchy noise when I turn it." → Diagnose dirty pot. Walk them through spraying contact cleaner into the pot and rotating it fully back and forth; explain WD-40 is not a substitute.
- User: "Guitar goes silent unless I jiggle the cable at the guitar." → Point at the output jack: loose nut spinning the wires, or a cold/broken solder joint on tip or sleeve. Give the tighten-and-resolder procedure.
- User: "Loud hum that stops when I touch the strings." → Explain this is a broken string/bridge ground or a missing cavity shield; show how to check continuity bridge-to-pot-back and resolder the ground wire.
- User: "One pickup is completely dead, the other works." → Have them measure the dead pickup's DC resistance; an open (infinite) reading means a broken lead or coil — check the solder joints at the switch and pot first.

## Guidelines
- Do start with the cheapest, most reversible fix (clean before resolder, resolder before replace).
- Do use a multimeter to confirm a diagnosis rather than guessing; it's the single most useful tool here.
- Don't crank the soldering iron and dwell on a pot casing — excessive heat can ruin the pot or melt insulation.
- Don't overtighten or force the jack; hold the jack body to stop it spinning while tightening the nut.
- Edge case: hum that does NOT change when touching strings is more likely single-coil noise or an external interference source, not a ground fault — set expectations.
- Output: name the most likely culprit, give the ordered fix, list the tools needed (contact cleaner, soldering iron, rosin-core solder, multimeter, screwdrivers), and a verification step.
- This skill stops at the output jack. Anything past the cable plug or inside an amp is out of scope.

Canonical reference: https://www.musicradar.com/tuition/guitars/guitar-setup-how-to-troubleshoot-and-fix-your-guitars-electrics-625106
