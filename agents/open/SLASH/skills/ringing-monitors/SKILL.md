---
name: ringing-monitors
description: Use this skill when the user wants the hands-on step-by-step procedure for ringing out stage monitors / wedges specifically — using a graphic EQ to find and notch feedback frequencies on a floor monitor, building gain-before-feedback margin for a wedge, the practical method an engineer follows at the wedge. Trigger on "ring out the wedges", "ring out a monitor", "how to ring out a stage monitor", "graphic EQ feedback notch", "monitor feedback procedure". For the general concept use ringing-out; for the broader monitor SOP use monitor-engineer-sop.
---

# Ringing Out Stage Monitors: The Wedge Procedure

This skill gives SLASH the concrete, hands-on procedure for ringing out a floor monitor (wedge) so a performer can have a loud, stable mix without feedback. It is the practical, monitor-specific companion to the general ringing-out concept. Canonical reference: https://carvinaudio.com/blogs/audio-education/how-to-ring-out-your-stage-monitor-system-part-2

## Instructions

1. Set up safely: place the wedge in its actual performance position with the actual mic in its actual position (placement changes the feedback frequencies). Make sure no one is standing at the mic and warn anyone nearby — it will get loud and ring.
2. Insert a **graphic EQ** (or use the console's monitor-send GEQ) on that monitor send, with all bands flat to start. Set the monitor send level low.
3. Slowly raise the monitor send/gain until the wedge **just begins to ring** — let one frequency start to sustain, but don't let it run away or get painfully loud.
4. Identify the ringing band: on a graphic EQ, sweep/pull down candidate sliders to find the one that kills the ring; with a parametric, boost-sweep to find it then cut. Notch that single frequency with a narrow cut.
5. Raise the gain again until the **next** frequency rings, notch it the same way, and repeat. Typically the first few notches buy most of your margin.
6. Stop after a handful of notches (commonly 3–6); once you have comfortable headroom before feedback at working level, you're done. Don't keep notching — it hollows the monitor's tone.
7. Restore the send to working level and confirm margin by speaking/singing into the mic at performance level; there should be clear gain in hand before it rings.
8. Repeat per wedge/mic position that needs it, and re-check after performers and gear move on stage, since that shifts the feedback behavior.

## Examples

- User: "Walk me through ringing out a wedge." → Position wedge + mic, flat GEQ on the send, raise gain to first ring, notch the band, repeat for the next few rings, stop at safe margin, confirm at working level.
- User: "How many frequencies should I notch on a monitor?" → Usually 3–6; stop once you have comfortable margin — over-notching guts the tone.
- User: "The wedge sounded fine at check but feeds back during the show." → Stage changed (performer position, mic handling, added stage volume); re-establish margin, tighten mic technique, and don't run the wedge past its rung-out level.
- User: "Do I use a graphic or parametric EQ to ring out a monitor?" → Either; graphic is fastest for finding the band by pulling sliders, parametric gives narrower surgical notches.

## Guidelines

- Always ring out with the mic and wedge in their real performance positions — moving them invalidates the notches.
- Use narrow cuts and stop at safe margin; over-ringing-out hollows the wedge.
- Confirm margin at true working level before declaring it done.
- Keep stage volume disciplined — every extra dB erodes the margin you just built.
- Defer the concept/feedback theory to ringing-out and the full monitor workflow to monitor-engineer-sop.
