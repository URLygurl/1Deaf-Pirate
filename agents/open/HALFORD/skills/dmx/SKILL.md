---
name: dmx
description: Use when the user asks about DMX512 control — addressing fixtures, channels and universes, patching, daisy-chaining and cabling, XLR connectors (5-pin vs 3-pin), termination, signal troubleshooting, RDM, and node/Art-Net/sACN distribution for a lighting rig. Trigger on "set the DMX address", "how many channels", "do I need a terminator", "split the universe", "DMX not responding", "Art-Net vs sACN". NOT for fixture selection (use lighting-equipment), hang positions (use concert-lighting-plan), or creative looks (use lighting-storytelling).
---

# DMX512

Handles the control-protocol layer of a lighting rig: how the console talks to fixtures over DMX512, how to address and patch them, how to cable and terminate the line, and how to troubleshoot when something doesn't respond.

## Instructions
1. Explain the basics when needed: DMX512 is a one-way serial protocol carrying up to 512 channels (slots) per universe, each 0–255 (8-bit). One fixture occupies a contiguous block of channels equal to its DMX footprint/personality.
2. Address fixtures: assign each fixture a start address so its channel block fits within 1–512 without overlap (unless intentional cloning). Two fixtures sharing an address respond identically. Track addresses in a patch sheet.
3. Plan universes: when total channels exceed 512, split across multiple universes; size universes by summing fixture footprints plus headroom.
4. Cable correctly: daisy-chain fixtures DMX-out to DMX-in using shielded twisted-pair (110-ohm) DMX cable, not mic cable. Standard connector is 5-pin XLR; many fixtures use 3-pin. Keep runs reasonable (rule of thumb up to ~300m / ~32 devices per line before a buffer/splitter).
5. Terminate the line: fit a 120-ohm terminator on the last fixture of each chain to prevent signal reflections and flicker.
6. Distribute at scale: use opto-splitters to branch chains, and DMX nodes to convert Ethernet-based Art-Net or sACN (streaming ACN, E1.31) into physical DMX universes for large rigs.
7. Use RDM (Remote Device Management) where supported to read/set addresses and query fixture status back up the same line.
8. Troubleshoot no-response/flicker methodically: check address overlap, correct personality/footprint, cable type and pinout, broken/loose connectors, missing terminator, universe mismatch, and splitter/node configuration.

## Examples
- "I have 12 fixtures that use 16 channels each — how do I address them?" → Footprint is 16; assign starts at 1, 17, 33, … (16×12 = 192 channels, fits one universe), and provide the patch list.
- "My last fixture in the chain flickers." → Check for a missing 120-ohm terminator, then cable quality, connector seating, and run length.
- "When do I need a second universe or Art-Net?" → When total channels exceed 512, or when distributing many universes over a network; explain splitters vs. nodes and Art-Net/sACN.

## Guidelines
- Always confirm each fixture's DMX footprint/personality before addressing — the same model can have multiple modes with different channel counts.
- Prevent overlap: blocks must not exceed channel 512 and must not collide unless cloning is intended.
- Insist on real DMX cable (120-ohm data) and proper termination; mic cable and missing terminators are the top causes of flaky control.
- For 3-pin/5-pin mismatches, use proper adapters and verify pinout; don't assume polarity.
- For large or networked rigs, reach for splitters, nodes, and Art-Net/sACN rather than overloading a single physical line.
- Deliver a patch sheet (fixture → start address → footprint → universe) as the concrete artifact.
- Canonical reference: https://en.wikipedia.org/wiki/DMX512
