---
name: psychoacoustics
description: Use when the question is about how humans PERCEIVE sound rather than its raw physics — hearing range, loudness perception, equal-loudness contours (Fletcher-Munson), the dBA weighting, auditory masking, critical bands, pitch perception, timbre, sound localization, the precedence/Haas effect, just-noticeable differences (JND), the Bark/ERB scales, or why MP3/perceptual codecs work. Trigger on phrases like "why does it sound louder", "masking", "Fletcher-Munson", "how do we localize sound", "Haas effect", "psychoacoustic". This is GEDDY's perception skill — NOT for pure wave physics (use acoustics-foundations) or room design.
---

# Psychoacoustics

This skill gives GEDDY a working model of human hearing: how the ear and brain map physical sound onto perceived loudness, pitch, timbre, and spatial location, and where perception diverges from physics. It governs mixing, monitoring, codec, and "why does it sound like that" judgments. Canonical reference: https://en.wikipedia.org/wiki/Psychoacoustics

## Instructions

1. Start from the audible range: roughly **20 Hz – 20 kHz** for young healthy ears, narrowing with age (presbycusis cuts the top end first). Most musical fundamentals sit below ~5 kHz; everything above is harmonics/air.
2. Separate physical level (SPL, in dB) from perceived **loudness** (in phons/sones). Use equal-loudness contours (ISO 226 / Fletcher-Munson): the ear is most sensitive ~2–5 kHz and far less sensitive at low frequencies, especially at low listening levels. Explain that this is why bass seems to vanish when you turn a mix down.
3. Reach for **dBA weighting** when discussing perceived loudness of environmental/measured noise — it approximates the ear's frequency response at moderate levels.
4. Use **masking** to explain audibility: a louder tone masks quieter tones nearby in frequency (simultaneous/frequency masking) or in time (temporal/pre- and post-masking). Tie this to **critical bands** (Bark scale, ~24 bands; or ERB scale) — masking is strongest within a critical band. This is the basis of perceptual codecs (MP3, AAC).
5. For pitch: pitch tracks frequency but is not identical to it (the "missing fundamental" / virtual pitch — the brain infers a fundamental from harmonics). Timbre comes from spectral envelope plus the attack/decay envelope.
6. For localization, name the cues: **ITD** (interaural time difference, dominant below ~1.5 kHz), **ILD** (interaural level difference, dominant above ~1.5 kHz), and **HRTF**/pinna spectral cues for elevation and front-back. Use the **precedence (Haas) effect**: for delays ~1–35 ms the brain localizes to the first arrival even if a later copy is louder.
7. Quote **JND** ballparks when relevant: ~0.5 dB level, ~0.2–0.3% frequency in the mid-band — useful for "can anyone hear this difference?" questions.

## Examples

- **User: "Why does my mix sound bass-heavy when loud but thin when quiet?"** → Equal-loudness contours: at higher SPL the ear's low-frequency sensitivity rises relative to mids, so bass seems to swell. Recommend referencing at a consistent, moderate monitoring level (~75–85 dB SPL).
- **User: "How does MP3 throw away data without me hearing it?"** → Frequency and temporal masking within critical bands — the codec discards components masked by louder nearby content, and quantizes more where the ear is less sensitive.
- **User: "Two speakers, one delayed 10 ms — why do I hear it from the first one?"** → Precedence/Haas effect; within ~1–35 ms the brain fuses them and localizes to the first arrival. Beyond ~35–50 ms it becomes an audible echo.
- **User: "Can listeners tell a 0.3 dB change?"** → Around the JND for level (~0.5–1 dB in context); usually not reliably in a mix. Manage expectations.

## Guidelines

- DO map physical → perceptual explicitly: dB SPL is not loudness; Hz is not pitch.
- DO cite the sensitive band (~2–5 kHz) when explaining harshness, intelligibility, or fatigue.
- DON'T claim humans hear well above 20 kHz or that "golden ears" beat the JND by large margins without evidence.
- DON'T confuse masking (perceptual) with destructive interference (physical) — they are different mechanisms.
- Edge case: hearing loss, tinnitus, and age shift all of the above per individual; flag when a claim is population-average.
- Output expectation: tie the perceptual phenomenon to a concrete production/monitoring decision when one is implied.
