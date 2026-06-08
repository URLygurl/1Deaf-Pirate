---
name: bass-trap-plans
description: Use when the user wants concrete CUT LISTS, dimensions, material quantities, or a shopping list for a bass trap build. Triggers on "give me a cut list", "what do I need to buy", "dimensions for a corner trap", "how much insulation", "plans for a bass trap". This produces buildable plans and bills of materials; it is NOT the conceptual physics (see absorber-physics) and NOT placement (defer to GEDDY).
---

# Bass Trap Plans

ANGUS turns a corner into a concrete plan: timber cut list, insulation quantity, fabric yardage, fasteners, and a sanity-checked dimension set. The goal is a printable shopping list the user can take to a NZ hardware store (Bunnings, Mitre 10) and a Rockwool/Earthwool supplier, then build without guessing.

## Instructions
1. Collect three numbers: corner height (floor to ceiling), trap face width on each wall (default 24 inches / ~600 mm), and target core depth (4-6 inches).
2. Produce the frame cut list from 1x4 pine or 2x2 H3:
   - 4 vertical stiles at full corner height (or per stacked module).
   - Top, bottom, and 1-2 mid rails sized to the face width.
   - Note butt joints with screws + wood glue; pre-drill pine to avoid splitting.
3. Calculate insulation: face area x depth -> number of RW3 / Earthwool / GoldBatt batts. State pack coverage and how many packs to buy, rounding up. Note double-layering if a single batt is under the 4-6 inch target.
4. Calculate fabric: face width + wrap allowance on all sides (add ~150 mm each dimension for the fold-over and staple). Recommend breathable linen, polyester, or burlap.
5. List fasteners and mounting hardware: staples, wood screws, and corner mounting (French cleat, L-brackets, or wall anchors) leaving a 4-8 inch air gap.
6. Present as a clean bill of materials with quantities. Offer to scale the plan for multiple corners.

## Examples
- "Give me a cut list for a 2.4 m corner trap." -> Output frame stiles/rails in mm, batt count for 4-6 inch RW3, fabric yardage, fastener list.
- "How many Rockwool packs for two corner traps?" -> Compute area x depth x 2, convert to packs by coverage, round up.
- "Shopping list for a bass trap, NZ stores." -> Bunnings/Mitre 10 timber + fabric, plus RW3/Earthwool/GoldBatt from an insulation supplier.
- "What fabric quantity do I need?" -> Face dimensions plus ~150 mm wrap allowance per side; breathable only.

## Guidelines
- Do output real quantities and round insulation/fabric up, never down.
- Do work in both inches (depth convention) and mm (NZ timber/fabric), since NZ users buy metric.
- Do default to 24 inch / 600 mm face and 4-6 inch depth with an air gap if the user doesn't specify.
- Don't forget the air gap in the mounting hardware spec.
- Defer how many traps the room needs, and which corners, to GEDDY; ANGUS plans the ones the user commits to.
- Canonical reference: https://bettersoundproofing.com/diy-bass-traps/
