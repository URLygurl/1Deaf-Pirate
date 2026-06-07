---
name: cable-repair
description: Use this to repair a failing or dead instrument/guitar cable (1/4" TS) by re-terminating or replacing a connector — for crackling, intermittent, or no-signal cables where the fault is at or near a plug. Trigger on "my cable crackles when I move it," "guitar cable only works at a certain angle," "I want to re-solder my cable plug," "fix the connector on my lead," or "how do I solder a new 1/4 inch jack onto my cable." This is for the cable and its plugs only; for faults inside the guitar use guitar-electrics-fix, and to first locate which link is bad use signal-troubleshoot.
---

# Cable Repair

This skill repairs the most common point of failure in any rig: the instrument cable, which almost always fails at the strain point right behind a plug. A standard guitar cable is unbalanced TS (tip-sleeve): the center conductor carries signal to the tip, and the braided/foil shield carries ground to the sleeve. Repair means cutting back to good cable and soldering a fresh connector — quick, cheap, and far more reliable than a wiggle-and-hope. Open-frame, solderable connectors (e.g. Switchcraft/Neutrik) make this straightforward.

## Instructions
1. Confirm the cable is the fault, not the guitar or amp (flex-test near each plug while listening; crackle on flex at one end localizes it). If unsure which link is bad, run signal-troubleshoot first.
2. Cut off the suspect plug an inch or two past the strain relief, or unscrew the connector barrel if it's a solderable type you can reuse.
3. Strip ~1/2" of the outer jacket without nicking the shield. Gather/twist the braided shield (and peel back any foil) into a single ground conductor; strip ~1/4" of the inner insulation to expose the center signal conductor.
4. Identify the lugs: the long lug that runs to the plug tip is signal (hot); the lug attached to the sleeve/barrel is ground. Pre-tin both the wires and the lugs.
5. Slide the barrel/strain-relief boot onto the cable BEFORE soldering (the classic mistake is soldering the plug on with the barrel left off).
6. Solder the center conductor to the tip lug and the shield to the sleeve/ground lug. Aim for shiny, fully-flowed joints; keep stray shield strands from bridging hot to ground (a short = dead cable).
7. Crimp the strain-relief tabs over the jacket so pull is taken by the jacket, not the solder joints. Screw the barrel back on.
8. Test for continuity and shorts with a multimeter: tip-to-tip should read ~0 ohms, sleeve-to-sleeve ~0 ohms, and tip-to-sleeve should read open (infinite). Then flex-test through an amp.

## Examples
- User: "My cable crackles whenever I move it near the plug." → Confirm it's the cable via flex-test, then re-terminate that end: cut back, strip, slide the boot on, solder tip and sleeve, crimp strain relief, multimeter-verify.
- User: "How do I solder a new 1/4 inch plug onto my guitar cable?" → Give the full procedure, emphasizing barrel-on-first, tip=signal/sleeve=ground, no stray shield strands, and the continuity/short test.
- User: "Cable only passes signal at a weird angle." → Classic broken conductor or cold joint at the strain point; re-terminate the offending plug rather than trying to bend it into working.
- User: "My multimeter shows tip-to-sleeve continuity on my cable." → That's a short between signal and ground; reopen the plug and clear the stray shield strand bridging the lugs, then re-test.

## Guidelines
- Do flex-test to localize which plug failed, and re-terminate that end rather than tossing the whole cable when the cable body is fine.
- ALWAYS slide the barrel/boot onto the cable before soldering the connector.
- Do verify with a multimeter: ~0 ohms tip-to-tip and sleeve-to-sleeve, OPEN tip-to-sleeve. A short or open means redo the joint.
- Don't leave stray shield strands near the tip lug — they cause intermittent or dead shorts.
- Don't cook the connector; quick clean joints beat long heat that melts insulation and creates cold joints.
- Edge case: this skill covers unbalanced TS instrument cables; balanced TRS/XLR mic cables have an extra conductor and different wiring — flag the difference if asked.
- Output: the localized fault, the step list with tools (soldering iron, rosin-core solder, wire strippers, multimeter, replacement connector), and the verification result.

Canonical reference: https://www.ifixit.com/Guide/Guitar+Cable+Repair/76940
