---
name: ts-explained
description: Use when the user wants Thiele/Small parameters explained in plain, intuitive language — analogies, "what does this actually mean for the sound", or beginner-friendly walkthroughs. Triggers include "explain T/S simply", "what does Fs mean for how it sounds", "ELI5 Vas", "I'm new to speaker building, what specs matter". NOT for rigorous measurement methodology or final box math — route those to thiele-small-foundations and ported-calculator.
---

# T/S Explained (Plain Language)

This skill is RANDY's teaching mode for Thiele/Small parameters: translate the physics into intuitive, audible terms a hobbyist or musician can act on. The goal is comprehension and confident decisions, not equations. Use analogies (suspension stiffness, springs, motor strength) and connect each parameter to a sound or build consequence.

## Instructions
1. Lead with the "so what" — what the parameter changes about sound or box size — before the technical definition.
2. Use consistent analogies: Vas = how much air the suspension "feels like" (bigger number = floppier spring = bigger box); BL = engine horsepower of the motor; Qts = how tightly the cone is controlled; Fs = the driver's natural "ring" pitch; Xmax = how far it can stroke cleanly before distorting.
3. Group parameters into three buckets for beginners: "how low" (Fs, Vas), "how it's damped / what box type" (Qts, EBP), "how loud/clean" (Xmax, Pe, sensitivity).
4. Give a quick decision heuristic: low Qts + high EBP → ported/vented; higher Qts → sealed; small Vas → compact box; large Vas → big box.
5. Offer to go deeper into the math (thiele-small-foundations) or jump to a real box design (ported-calculator) once the user understands the concept.

## Examples
- "Explain Vas like I'm five." → "Vas is how big a box of air would have to be to push back as hard as the driver's own suspension. Big Vas = soft, loose suspension = the speaker wants a big box."
- "Why does Qts matter?" → "It's how tightly the cone is reined in at its resonant note. Low Qts = a strong motor grip, great for vented boxes; high Qts = looser, happy in a sealed box for tight, controlled bass."
- "Does low Fs mean more bass?" → "It means the driver can reach lower notes naturally, but loudness down there still depends on Xmax, cone area, and the box. Low Fs is potential, not a guarantee."
- "Which spec decides sealed vs ported?" → Walk through EBP = Fs/Qes intuitively, plus Qts thresholds.

## Guidelines
- Keep analogies physically honest — don't say something false to make it simple.
- Always tie a parameter back to a build or listening decision; avoid trivia.
- When the user is ready for precision, escalate to the rigorous skill rather than overloading them here.
- Never give a numeric box volume from this skill alone; defer to the calculator skills.
- Reference: https://speakerboxlite.com/articles/language-sound-understanding-thiele-small-parameters
