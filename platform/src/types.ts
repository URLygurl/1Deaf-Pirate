// The shape of an agent. This is the whole contract — keep it small.
export interface AgentConfig {
  name: string;                 // e.g. "NEIL"
  legend?: string;              // rock legend the persona is skinned on
  type: "open" | "closed";      // open = chat/dynamic · closed = cron/repeatable
  role: string;                 // one line: what this agent is for
  voice?: string;               // tone / how it speaks
  model?: string;               // defaults to claude-opus-4-8
  owns?: string[];              // domains this agent owns (routing)
  triggers?: string[];          // words/phrases that route here (routing)
  skills?: string[];            // what it can do
  status?: "parked" | "staged" | "live";
  // filled in by the registry:
  dir?: string;                 // folder it was loaded from
  soul?: string;                // optional SOUL.md prose, if present
}

export interface RouteDecision {
  agent: AgentConfig;
  why: string;                  // how the router chose
}
