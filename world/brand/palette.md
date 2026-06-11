# Brand — Palette

Full system + rationale: [`docs/design.md`](../../docs/design.md).
Canonical tokens (import these): [`tokens.css`](./tokens.css).

## Signature
- **DefPirate Green** `#7EFF00` — the signature. Means **live / active / success / "on now."**

## Roles (not decoration)
- `--live` `#7EFF00` — live / active / success (signature)
- `--info` `#33c8ff` — information / interactive / focus / links
- `--warn` `#ffb22e` — standby / caution
- `--alert` `#ff4d52` — incident / error
- Surfaces: `--bg` `#070b12` near-black navy · panels `#0d141f` / `#111b2a` · ink `#dce8f5`

## Type
- **Oswald** (display) · **Barlow Condensed** (UI/body) · **JetBrains Mono** (data/labels)

> Locked 2026-06: navy+cyan dashboard system canonical; green = live, cyan = info.
> Don't add per-file hex — extend `tokens.css`, document the role in `design.md`.
