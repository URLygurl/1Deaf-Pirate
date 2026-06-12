# Production hardening — Bitwarden + iron-proxy

Per the Nous/Hermes production-deployment guidance, a prod squad should run with
**two Hermes-native integrations** that close the biggest gaps in our own
`pre-launch-checklist.md`:

| Integration | Replaces / fixes | Our gap it closes |
|---|---|---|
| **Bitwarden** (secrets manager) | plaintext `.env` keys | "secrets in `.env`" — vaulted, rotatable, pulled at runtime instead of sitting on disk |
| **iron-proxy** (egress firewall) | open / unmanaged egress | "Hermes profiles do NOT sandbox… real containment = a network allow-list" — the actual leash |

> **Status: planned, not yet wired.** The tools are chosen; the **exact config is
> still to be confirmed against the Hermes CLI/docs on the box** before we enable
> either. No invented commands here — see "Verify first" below.

## Why these two

Our current posture (honest): keys live in `.env` (gitignored), and an agent has
the **same FS/network reach as the user running it** (Hermes doesn't sandbox). For
a contained dev box that's tolerable; for a **production** always-on squad it isn't.
These two integrations are the standard fix:

- **Bitwarden** — secrets never sit in plaintext on the Droplet. Hermes pulls them
  from the vault at runtime; rotation and revocation happen in Bitwarden, not by
  editing files. Pairs with our "distinct bot token per profile" rule.
- **iron-proxy** — all squad egress goes through a proxy with a **domain
  allow-list**. An agent (or a prompt-injection at NEIL's front desk) can only
  reach sanctioned hosts; everything else is denied. This is the OS-level leash the
  checklist said we needed — and it's the real backstop behind the action-lock.

## Verify first (before wiring — don't guess)

On the box, confirm the actual integration surface and config keys:

```
hermes --help | grep -iE 'bitwarden|proxy|secret|vault'    # discover subcommands
hermes config            # look for secrets / proxy / egress sections
# (and the Hermes docs for the Bitwarden + iron-proxy integration setup)
```

Paste what those show and we'll write the real setup — not before.

## Wiring plan (fill once verified)

1. **Bitwarden**
   - [ ] Connect Hermes to a Bitwarden vault (org + access token).
   - [ ] Migrate `ANTHROPIC_API_KEY` + any per-profile bot tokens into the vault.
   - [ ] Confirm Hermes reads them at runtime; remove the plaintext copies from `.env`.
2. **iron-proxy**
   - [ ] Stand up iron-proxy with a **deny-by-default** egress allow-list
         (skill-source sites, Anthropic API, the gateway's channels — nothing else).
   - [ ] Route the squad through it; confirm a non-allow-listed host is blocked.
   - [ ] Document the allow-list as source-of-truth and review it on every change.

## Where this sits in the plan

This is **Phase 4 (safety check)** material — part of arming the failsafes before
DIME/NEIL flip to `live`. It does **not** block the current contained dev work, but
it **gates** the move to a real always-on production posture.
