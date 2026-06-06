// CLI entry. `npm run hermes "your message"`  ·  `npm run list`
import { loadRegistry } from "./registry.ts";
import { ask } from "./hermes.ts";

const args = process.argv.slice(2);
const agents = loadRegistry();

if (args[0] === "--list" || args.length === 0) {
  console.log(`\n🏴‍☠️  Deadsound roster (${agents.length} loaded):\n`);
  for (const a of agents) {
    console.log(`  ${a.name.padEnd(8)} ${a.type.padEnd(7)} ${a.role}`);
  }
  if (args.length === 0) console.log(`\nUsage: npm run hermes "your message"\n`);
  process.exit(0);
}

if (!process.env.ANTHROPIC_API_KEY) {
  console.error("Set ANTHROPIC_API_KEY (or add it to ../.env) first.");
  process.exit(1);
}

const message = args.join(" ");
console.log(`\nYou → Hermes: ${message}\n`);
const result = await ask(message, agents, (d) => process.stdout.write(d));
console.log(`\n\n— ${result.agent} (${result.why})\n`);
