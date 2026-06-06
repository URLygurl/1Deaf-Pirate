// Loads every agent.json under ../agents/ into memory. Agents are data.
import { readdirSync, readFileSync, existsSync, statSync } from "node:fs";
import { join, resolve, dirname } from "node:path";
import { fileURLToPath } from "node:url";
import type { AgentConfig } from "./types.ts";

const HERE = dirname(fileURLToPath(import.meta.url));
const AGENTS_ROOT = resolve(HERE, "../../agents");

/** Walk agents/open + agents/closed, load each agent.json (+ optional SOUL.md). */
export function loadRegistry(): AgentConfig[] {
  const agents: AgentConfig[] = [];
  for (const bucket of ["open", "closed"]) {
    const root = join(AGENTS_ROOT, bucket);
    if (!existsSync(root)) continue;
    for (const name of readdirSync(root)) {
      const dir = join(root, name);
      if (!statSync(dir).isDirectory()) continue;
      const cfgPath = join(dir, "agent.json");
      if (!existsSync(cfgPath)) continue;
      const cfg = JSON.parse(readFileSync(cfgPath, "utf8")) as AgentConfig;
      cfg.dir = dir;
      cfg.type ??= bucket as "open" | "closed";
      const soulPath = join(dir, "SOUL.md");
      if (existsSync(soulPath)) cfg.soul = readFileSync(soulPath, "utf8");
      agents.push(cfg);
    }
  }
  return agents;
}
