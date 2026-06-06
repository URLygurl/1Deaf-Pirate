// The HIVE — shared memory. "What one learns, all learn."
// Minimal file-backed start: capture appends to a JSONL log; retrieve reads recent.
// Swap the backend later (Honcho / Mem0 / a DB) without changing callers.
import { appendFileSync, readFileSync, mkdirSync, existsSync } from "node:fs";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const HERE = dirname(fileURLToPath(import.meta.url));
const CAPTURE_LOG = resolve(HERE, "../../hive/1-capture/log.jsonl");

export interface HiveEntry {
  ts: string;
  agent: string;
  input: string;
  output: string;
}

/** Stage 1 — Capture. Record the work so the brain can learn from it. */
export function capture(entry: HiveEntry): void {
  mkdirSync(dirname(CAPTURE_LOG), { recursive: true });
  appendFileSync(CAPTURE_LOG, JSON.stringify(entry) + "\n");
}

/** Stage 2 — Retrieval. Pull the most recent N entries for context. */
export function retrieve(limit = 5): HiveEntry[] {
  if (!existsSync(CAPTURE_LOG)) return [];
  const lines = readFileSync(CAPTURE_LOG, "utf8").trim().split("\n").filter(Boolean);
  return lines.slice(-limit).map((l) => JSON.parse(l) as HiveEntry);
}
