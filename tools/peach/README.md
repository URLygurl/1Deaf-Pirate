# The Peach — biambient owner-control layer (prototype)

**Biambient** = content/apps that are legible to *both* a human and an agent, with the
owner sovereign over what the agent may do. **The Peach** is the drop-in component that
implements it.

- `peach-component.html` — self-contained, zero-dependency component. A host app mounts it
  with `PeachyWeb.mount(config)` and logs via `PeachyWeb.log(...)`. Gives the owner a
  floating control panel: bilingual on/off, read-only posture, require-approval, block-deletes,
  a live manifest view, and an audit log.
- `peachyweb-ops.html` — the Ops Center: a fleet dashboard that syncs with live apps over
  `BroadcastChannel('peachyweb-ops')`, showing every app's policy, event stream, and a
  policy matrix that broadcasts changes back.

**Design principle — sovereignty by absence:** the control plane is *not* in the agent's
manifest. `open_settings`, `set_policy`, `peach.*` simply don't exist in the agent's
vocabulary, so it cannot call them. Control plane ≠ data plane, by design rather than by ACL.

Status: prototype / testing. This is the reference implementation of the biambient idea.
