// resolve-avatar.js — tiny, dependency-free avatar resolver for the dashboards.
// Decouples *which image* from *where it's shown*, so avatars are hot-swappable:
// edit avatars.json (or drop a file in ./files/) and every surface updates.
//
// Usage (ES module):
//   import manifest from './avatars.json' assert { type: 'json' };
//   import { resolveAvatar } from './resolve-avatar.js';
//   const { src, alt, isFallback } = resolveAvatar('LEMMY', manifest);
//   <img src={src} alt={alt} data-fallback={isFallback} />
//
// Or load the manifest at runtime:  const m = await (await fetch('/world/brand/avatars/avatars.json')).json();

export function resolveAvatar(agentName, manifest, { rootPrefix = '' } = {}) {
  const key = String(agentName || '').toUpperCase();
  const entry = (manifest && manifest.agents && manifest.agents[key]) || null;
  const alt = (entry && entry.alt) || key;
  const fallback = join(rootPrefix, (manifest && manifest.fallback) || '');

  if (!entry || !entry.avatar) {
    return { src: fallback, alt, isFallback: true };
  }
  const a = entry.avatar;
  // Absolute URL or data URI → use as-is. Otherwise resolve under basePath.
  const src = /^(https?:)?\/\//.test(a) || a.startsWith('data:')
    ? a
    : join(rootPrefix, (manifest.basePath || ''), a);
  return { src, alt, isFallback: false };
}

// Resolve the whole squad at once → { DIME: {src,alt,isFallback}, ... }
export function resolveAll(manifest, opts) {
  const out = {};
  for (const name of Object.keys((manifest && manifest.agents) || {})) {
    out[name] = resolveAvatar(name, manifest, opts);
  }
  return out;
}

function join(...parts) {
  return parts.filter(Boolean).join('/').replace(/\/{2,}/g, '/').replace(':/', '://');
}

// CommonJS interop (optional)
if (typeof module !== 'undefined' && module.exports) {
  module.exports = { resolveAvatar, resolveAll };
}
