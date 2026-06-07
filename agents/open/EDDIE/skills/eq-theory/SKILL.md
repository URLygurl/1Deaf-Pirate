---
name: eq-theory
description: Use when the user asks how EQ works, how to set an equalizer, what frequency bands do, how to fix a harsh/muddy/boxy/thin/boomy sound, how to carve space between instruments, or about filter types and EQ concepts (high-pass, low-pass, shelf, bell, Q, notch, subtractive vs additive, dynamic EQ, linear phase). Triggers on "how do I EQ this", "what frequency is mud", "vocal sounds harsh", "make it brighter/warmer", "high-pass filter", "frequency masking", "carve space". This is single-tool frequency theory — NOT dynamics (use compression-theory) and NOT a full mix workflow (use mixing-essentials).
---

# EQ Theory

This skill gives EDDIE a practical theory of audio equalization: adjusting the balance of frequency components in a signal to fix problems, shape tone, and separate instruments. Equalization boosts or attenuates specific frequency bands using filters; in mixing it is the primary tool for tonal balance and for solving frequency masking between sources. Use it to explain controls, identify problem frequencies, and recommend moves. Canonical reference: https://en.wikipedia.org/wiki/Equalization_(audio)

## Instructions

1. Know the filter types and controls: bell/peaking (boost or cut a band, set by frequency, gain, and Q/bandwidth), high-shelf and low-shelf (lift or lower everything above/below a corner), high-pass/low-cut and low-pass/high-cut filters, and notch (very narrow deep cut for resonances/hum). Q sets how wide or surgical the move is.
2. Build a frequency mental map: sub/low (20-120 Hz, weight and rumble), low-mids (120-500 Hz, warmth but also mud/boom), mids (500 Hz-2 kHz, body and "boxy"/honky range), upper-mids/presence (2-5 kHz, attack, intelligibility, harshness), highs/air (5-20 kHz, brightness and sheen).
3. Default to subtractive EQ first: find and cut the offending frequency (mud ~200-400 Hz, boxiness ~400-800 Hz, harshness ~2-5 kHz) before boosting. Cutting cleans up; boosting adds character.
4. To find a problem band, sweep a narrow boost to locate the ugly resonance, then cut it with appropriate Q. Use wide Q for musical tonal shaping, narrow Q for surgical problem-solving.
5. High-pass non-bass tracks to remove unneeded low-end rumble and free headroom — but listen, since over-aggressive high-passing thins sources.
6. Solve masking by carving complementary spaces: when two sources fight (e.g. vocal vs guitar around 2-4 kHz, kick vs bass around 60-120 Hz), cut one where the other needs to live rather than just boosting both.
7. Use dynamic EQ or multiband when a problem only appears intermittently (e.g. occasional harsh "s" or boomy notes), so you process only when and where needed.
8. Prefer minimum-phase EQ for most mixing; reach for linear-phase EQ on parallel/master material where phase smearing of transients matters, accepting its pre-ringing and latency tradeoffs.
9. Always A/B at matched loudness — boosts make things louder and louder sounds "better." Judge EQ in the full mix, not in solo.

## Examples

- User: "My vocal sounds harsh and sibilant." → Identify harshness ~2-5 kHz (cut with moderate Q) and sibilance ~5-9 kHz (dynamic EQ or de-esser), rather than a static broad cut that dulls the vocal.
- User: "The mix is muddy." → Point at low-mid buildup ~200-400 Hz across multiple tracks, high-pass non-bass sources, and carve mud on the worst offenders instead of boosting highs to compensate.
- User: "How do I make an acoustic guitar sit under the vocal?" → Carve a gentle dip where the vocal lives (presence region) on the guitar, high-pass it, and add air on the vocal — complementary EQ for separation.
- User: "What's the difference between a shelf and a bell?" → Explain bell boosts/cuts a centered band by frequency/gain/Q; a shelf lifts or lowers everything beyond a corner frequency — use shelves for broad tonal tilt, bells for targeted moves.

## Guidelines

- Do cut before you boost; subtractive EQ usually cleans a mix more transparently than additive.
- Do match loudness when A/B-ing so a boost's extra level doesn't fool you.
- Do think in terms of carving complementary space to beat masking, not stacking boosts.
- Don't make narrow surgical boosts as tone shaping — wide Q is more musical for that.
- Don't EQ in solo and commit; the source only needs to work in context.
- Edge case: use dynamic/multiband EQ for intermittent problems and notch filters for fixed resonances/hum; reserve linear-phase EQ for where phase coherence matters.
- Output: name the target frequency range, the move (cut/boost, shelf/bell, Q), and the reason, deferring level-consistency issues to compression-theory.
