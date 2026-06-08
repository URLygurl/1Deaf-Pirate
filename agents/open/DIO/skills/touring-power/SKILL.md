---
name: touring-power
description: Use when the user is planning electrical power for a touring or one-off event LED lighting rig — building a per-fixture wattage budget, working out total amps and how many circuits or distro feeds a show needs, planning a power rider/spec sheet for venues, or sizing a generator for a portable LED lighting load. Triggers on "tour power plan", "power rider", "how much power does my rig need", "LED lighting power budget", "what genny for my lights", "circuits for a touring rig", "venue power requirements". NOT for the raw watts-to-amps formula in isolation (use lighting-power-calc), NOT for choosing physical distro boxes/cabling hardware (use distro-fundamentals), and NOT for fixed/permanent building wiring — that is licensed-electrician work only.
---

# Touring & Event LED Lighting Power Planning

End-to-end power planning for touring and one-off event LED lighting: take a fixture list, build a worst-case wattage budget, convert it to amps under NZ 230 V mains, distribute it across circuits and phases, and turn it into a venue-ready power rider. LED rigs draw far less than the old tungsten generation, but they bring high inrush, poor power factor on cheap drivers, and the touring trap of plugging into whatever the venue offers. The goal of this skill is a defensible plan the user can hand to a venue, a hire company, or a licensed electrician — not a wiring instruction. Portable plug-and-cable rigs the user can be coached to set up safely; anything that touches a building's fixed wiring is EWRB-licensed-electrician territory, full stop.

## Instructions
1. Establish the supply context first. Assume NZ 230 V / 50 Hz mains unless told otherwise. Core formula: Amps = Watts ÷ 230. Three-phase line-to-line is 400 V, and each phase behaves as its own 230 V single-phase leg in a wye/star system.
2. Build the fixture list as a worst-case wattage budget. Get quantity × max draw per fixture type. Use the fixture's stated max/peak wattage, not a marketing "typical" figure — LED PARs and washes pull most on full white at 100%. Common rough draws: small LED PAR 15–40 W, mid wash/par 60–150 W, moving-head wash/spot 200–600 W, large profile/beam movers 400–1000 W+, hazer/fogger 200–1500 W (heaters spike). Sum to a total connected watts.
3. Convert the total to amps at 230 V, then apply the 80% continuous rule — never plan a circuit or feed above 80% of its rating for a sustained show (e.g. a 16 A circuit → plan ~12.8 A max; a 32 A feed → ~25.6 A). Show the working with units so a venue or sparky can audit it.
4. Distribute the load across circuits. Map fixtures to circuits so each stays under the 80% headroom, and keep audio/console/backline on a separate clean circuit where possible. Critically: keep ALL audio gear on the same phase to avoid earth-loop hum and inter-phase voltage differences — never split a PA across phases.
5. For three-phase supplies, balance lighting load as evenly as practical across L1/L2/L3 so no single leg or the neutral is overloaded, while still respecting the "audio all on one phase" rule. State the per-phase amp figure.
6. Flag LED-specific gotchas explicitly: high switch-on inrush (many drivers energising together can trip a breaker even when steady-state draw is fine — stagger power-up or use soft-start distro), and poor power factor on budget fixtures (real current can exceed the watts ÷ volts figure, so leave extra headroom).
7. If a generator is in scope, size it to the connected load with margin. Total connected watts should sit comfortably under the genny's CONTINUOUS rating (not its peak/surge rating), with extra room for LED inrush — a common rule of thumb is genny continuous ≥ ~1.25× planned load. Note 50 Hz, clean-sine/inverter preference for sensitive electronics, and that hazers/heaters add surge.
8. Produce a power rider / spec the venue can action: total amps, number and rating of circuits or feeds required (e.g. "3× 16 A single-phase, or 1× 32 A three-phase"), connector types (e.g. 3-pin 230 V, 32 A single-phase, 5-pin 32 A three-phase / CEEform where relevant), and any RCD requirement.
9. Draw the portable-vs-fixed line clearly. If the rig plugs into existing outlets via leads and distro, coach the user: confirmed circuit ratings, no daisy-chaining cheap boards, RCD protection, cable derating for coiled/long runs. If the plan needs new outlets, sub-board changes, or anything hard-wired, stop and route it to a licensed EWRB electrician — that is not a coaching task.

## Examples
- User: "I'm touring a rig of 24× 150 W LED pars and 8× 400 W moving heads — what power do I need at each venue?" → Worst case: 24×150 = 3600 W + 8×400 = 3200 W = 6800 W total. At 230 V ≈ 29.6 A. Spread across three 16 A circuits (~9.9 A each, well under 12.8 A headroom) OR one 32 A three-phase feed (~9.9 A/phase). Note LED inrush, recommend RCD-protected distro, and produce it as a rider line.
- User: "Make me a power rider for a 12 kW LED festival rig." → 12000 W ÷ 230 ≈ 52 A. Recommend 1× 63 A three-phase (≈17 A/phase, under 80%) or equivalent, with audio kept on a single dedicated phase/circuit, stated connector types and RCD requirement. Show the math and the assumptions.
- User: "Can I run my whole touring rig off a wall socket?" → Almost certainly no. Sum the rig watts ÷ 230 vs ~10.4 A usable on a 13 A domestic outlet (80% rule); warn against daisy-chained power boards and recommend proper stage distro fed from an adequate circuit.
- User: "What generator should I hire for an outdoor LED show pulling about 8 kW?" → Size to continuous, not peak: ~8 kW load → aim for a genny ~10 kVA+ continuous to cover inrush and PF, 230 V/50 Hz, inverter/clean-sine preferred for fixtures and consoles, with hazer surge accounted for. Confirm with the hire company.

## Guidelines
- Do default to NZ 230 V / 50 Hz, always show Amps = Watts ÷ 230 working, and always apply the 80% continuous-load rule to every circuit and feed.
- Do build budgets from worst-case max wattage, and explicitly call out LED inrush and power-factor headroom — these are what actually trip touring rigs.
- Do keep all audio on one phase/circuit, and balance lighting load across phases without breaking that rule.
- Do output an actionable rider: total amps, circuit/feed count and ratings, connector types, RCD requirement, and stated assumptions.
- Don't treat a power plan as authorisation to wire, modify, or energise anything fixed. Portable plug-in rigs = coach the user to set up safely; fixed wiring, new outlets, sub-board or hard-wired changes = licensed EWRB electrician only, no exceptions.
- Don't ignore cable derating on long/coiled runs, neutral loading on unbalanced three-phase, or voltage drop on big distributed rigs — flag these for the electrician or hire company.
- Edge case: a generator's peak/surge rating is not its continuous rating — always size to continuous with margin for LED inrush and hazer heaters.
- Edge case: venue "spare" outlets may share a circuit with house systems — confirm the actual circuit and breaker before loading it.
- This is electrical-adjacent safety content: when in doubt, be conservative, add headroom, and defer the real install to a qualified electrician under AS/NZS 3000.

Canonical reference: https://www.litelees.com/guides/led-stage-lighting-tour-planning/
