---
name: lighting-power-calc
description: Use when the user needs to calculate electrical load for lighting or any stage gear — converting watts to amps, sizing circuits/breakers, checking how many fixtures fit on a circuit, balancing three-phase loads, or "will this trip the breaker". Triggers on "how many amps", "watts to amps", "circuit loading", "how many lights per circuit", "power draw", "load calculation". NOT for general safety concepts (use stage-power-basics) and NOT for choosing physical distro hardware (use distro-fundamentals). Math guidance only — a licensed electrician validates the real install.
---

# Lighting & Event Power Calculation

Practical electrical load math for lighting and event power: convert fixture wattage to current, sum loads, apply headroom, and confirm a circuit or breaker can carry the draw without tripping or overheating. Most failures on show day are loads exceeded or unbalanced phases, both preventable with simple arithmetic done in advance. This skill teaches the calculations and the safety margins, while leaving the physical wiring and final sign-off to a qualified electrician.

## Instructions
1. Confirm the supply voltage and frequency first — calculations are wrong if voltage is assumed. NZ/AU/UK/EU single-phase = 230 V, 50 Hz; North America = 120 V, 60 Hz. Three-phase line-to-line is 400 V (NZ/AU/EU) or 208 V (US).
2. Use the core formula: Amps = Watts ÷ Volts (I = P ÷ V). Example: a 575 W fixture on 230 V draws ≈ 2.5 A; on 120 V it draws ≈ 4.8 A. Same fixture, very different current.
3. Sum the current of every fixture on a circuit and compare to the breaker rating. Add inrush/headroom: never load a circuit beyond ~80% of its breaker rating continuously (e.g. a 10 A breaker → plan for ~8 A max). This is the single most common mistake.
4. Account for power factor and inrush for LED/electronic and tungsten-with-dimmer loads — drivers and lamps can pull more on switch-on. When in doubt, be conservative and leave more headroom.
5. For three-phase, split load as evenly as possible across L1/L2/L3. State the per-phase capacity (each phase is effectively its own single-phase 230 V supply in a wye/star system) and keep phases balanced to avoid overloading neutral/one leg.
6. Translate to a packing plan: e.g. "16× 575 W on 230 V = ~40 A total; spread across at least three 16 A circuits, ~13 A each, under the 80% rule." Show the working so the user (and their electrician) can check it.
7. For totals, mention demand: not every fixture runs at full simultaneously, but size for worst case unless a reliable diversity factor is known. Always end by recommending a licensed electrician confirm circuit, cable, and breaker sizing for the actual install.

## Examples
- User: "How many 1000 W fixtures can I put on a 16 A circuit at 230 V?" → 1000 W ÷ 230 V ≈ 4.35 A each; 80% of 16 A ≈ 12.8 A usable; so 2 fixtures (~8.7 A) safely, a 3rd (~13 A) is over the prudent limit. Show the math.
- User: "Convert 2400 W to amps." → Ask/confirm voltage. At 230 V ≈ 10.4 A; at 120 V = 20 A. Note the breaker headroom rule.
- User: "We have 24 LED PARs at 150 W each — what supply do we need?" → 24 × 150 = 3600 W; at 230 V ≈ 15.7 A total; spreadable over two 16 A circuits with headroom, or balanced across three phases; flag LED inrush/PF and electrician sign-off.
- User: "Will my rig trip a single 13 A wall socket?" → Sum the rig's watts ÷ 230, compare to ~10.4 A usable (80% of 13 A), and warn against overloading a domestic outlet — recommend proper stage distro.

## Guidelines
- Do always confirm voltage before calculating; show your working with units so it's auditable.
- Do apply the ~80% continuous-load headroom rule and call out inrush/power-factor for LED and dimmed tungsten loads.
- Do balance three-phase loads and explain per-phase capacity clearly.
- Don't present a load calc as authorisation to wire or energise anything — it's planning math. The actual cable, breaker, and connection sizing must be confirmed and installed by a licensed electrician under local rules (AS/NZS 3000 in NZ/AU).
- Don't ignore neutral loading, cable derating in heat/coiled runs, or long-cable voltage drop on big rigs — flag these as factors for the electrician.
- Edge case: generators have their own rating and surge limits; total connected load must sit comfortably under the genny's continuous rating, not its peak.
- Output expectation: a clear number, the formula used, the headroom applied, and a per-circuit/per-phase distribution suggestion.

Canonical reference: https://avad3.com/how-to-calculate-lighting-power-for-your-event/
