---
name: signal-troubleshoot
description: Use this to isolate where a guitar rig loses or degrades signal across the whole chain — guitar, cables, pedals, and amp — when the player reports no sound, intermittent dropouts, weak/thin output, unexpected noise, or signal that dies somewhere downstream. Trigger on "no sound at all," "rig keeps cutting out," "where is my signal dying," "tone went weak and muddy," or "loud buzz somewhere in my pedalboard." This is the divide-and-conquer chain isolation skill; for fixing a specific component once located, hand off to guitar-electrics-fix, cable-repair, or amp-first-aid.
---

# Signal Troubleshoot

This skill finds *where* in the signal path a problem lives before anyone fixes anything. The signal chain runs guitar → cable → (pedals/effects loop) → cable → amp → speaker. The fastest method is divide-and-conquer: cut the chain in half, test, and keep halving until the faulty link is isolated. Most "my whole rig is dead" reports come down to a single bad cable, a depleted pedal battery, a wrong input, or a muted amp channel.

## Instructions
1. Confirm the basics first: amp powered on and off standby, correct channel/input selected, volume up on guitar and amp, and the guitar's pickup selector not in a dead position.
2. Establish a known-good baseline: plug the guitar straight into the amp with one cable you trust, bypassing all pedals. If sound returns, the fault is in the effects portion; if not, it's the guitar, that cable, or the amp.
3. Swap one variable at a time. Replace the cable with a known-good one; try a different instrument; try a different amp or input. Never change two things at once or you lose the signal you're isolating.
4. For pedalboards, bypass the whole board, then reintroduce pedals one at a time (or binary-search the chain) until the offending unit appears. Suspect dead 9V batteries, a failed power supply, and bad patch cables first.
5. Flex-test every cable while listening: wiggle each plug at the jack and bend the cable near the connectors. Crackle or dropout on flex means a failing cable or jack at that point.
6. Characterize the symptom: total silence (open circuit / wrong input) vs. intermittent (mechanical/cable/jack) vs. weak-and-thin (impedance, dying battery in an active buffer, or a tone-suck issue) vs. noise/hum (grounding, power, or interference).
7. Once the faulty link is localized, route to the right fix: guitar internals → guitar-electrics-fix, cable → cable-repair, amp internals → amp-first-aid (with the lethal-voltage caveat).

## Examples
- User: "My whole rig is dead, no sound at all." → Run the checklist (power, standby, channel, volume), then guitar-straight-into-amp baseline to split the chain, then swap cable and instrument to localize.
- User: "It works for a minute then cuts out randomly." → Point to an intermittent mechanical fault; flex-test cables and jacks, check pedal power, isolate by swapping one cable/pedal at a time.
- User: "Signal got weak and muddy after I added pedals." → Suspect a dying battery in a buffered/active pedal, tone-suck from true-bypass loading, or a bad patch cable; bypass the board and reintroduce pedals one at a time.
- User: "There's a loud buzz somewhere in my board but I can't find it." → Binary-search the chain, check power-supply grounding and daisy-chain hum, and isolate the offending pedal by powering them individually.

## Guidelines
- Do change exactly one variable per test and keep a known-good reference cable and the guitar-into-amp baseline as your anchors.
- Do classify the symptom (silent vs. intermittent vs. weak vs. noisy) early — it sharply narrows the candidates.
- Don't start replacing parts before you've localized the fault; this skill is diagnosis, not repair.
- Don't overlook the trivially obvious: wrong input jack, standby switch, muted channel, or a guitar volume rolled off.
- Edge case: a fault that follows the guitar when you swap everything else means the problem is inside the guitar — escalate to guitar-electrics-fix.
- Output: state which half of the chain the fault is in, the test that proved it, the most likely component, and the hand-off skill for the actual repair.

Canonical reference: https://www.guitarworld.com/lessons/how-to-troubleshoot-guitar-signal-problems
