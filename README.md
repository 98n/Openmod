# Openmod. 
# 🚀 OpenMod: Universal Prompt-Only Mod Engine for AI Coding Agents

OpenMod is an open-source, zero-code runtime standard for designing, testing, and chaining behavioral modifications ("mods") across AI coding agents. 

By injecting a structured markdown lifecycle middleware loop into your agent's system layer, OpenMod brings programmatic features—like **Claude Code Mods**—to any LLM environment, including **Cursor, OpenCode, Aider, ChatGPT, and Windsurf**, without requiring local daemon servers or complex API proxies.

---

## 🛠️ The IDE Tech Stack & Architecture

OpenMod bridges the gap between text prompts and local IDE tools. It formats agent context into a deterministic, two-stage interceptor pipeline:

```text
[ User Prompt / IDE Trigger ] 
              │
              ▼
   🪝  beforeAction Hook (e.g., Security Scan, Code Guardrails, Style Checks)
              │
              ▼
   ⚙️  EXECUTE (Native File Systems, Local Stdio, Git Shells, IDE file writes)
              │
              ▼
   🪝  afterAction Hook (e.g., Git Pipelines, PII Redaction, Formatting logs)
              │
              ▼
[ Final Agent / IDE Response ]
```

### Supported Integration Stacks
*   **Model Protocols:** Model Context Protocol (MCP) text boundaries, Language Server Protocols (LSP).
*   **Local Runtimes:** Node.js script chains, Python hooks, Native Shell Execution (`bash`, `zsh`, `cmd`).
*   **Workspace Configs:** `.cursorrules`, `.windsurfrules`, `CLAUDE.md`, `system_instructions`.

---

## 📥 Quick Start Setup

To turn any standard AI assistant into a modded engineering instance, choose your configuration layer:

### Method 1: Project-Level Setup (Cursor, Aider, OpenCode)
1. Copy the core configuration payload from the `openmod-core.md` file in this repository.
2. Paste it directly into your local workspace prompt rules folder (e.g., `.cursorrules` in Cursor, `.windsurfrules` in Windsurf, or `CLAUDE.md` in Claude Code).

### Method 2: Automated Local Bundling (Recommended)
If you have a terminal environment set up locally, run our dynamic setup initializer to instantly build the workspace structure on your host machine:
```bash
curl -sSL https://githubusercontent.com | bash
```

---

## 🏪 The IDE Mod Marketplace Index

Our repository includes standard starter mods that you can copy, paste, and stack together right now:

### 1. Destructive Terminal Guardrail (`/mods/security-guardrail.md`)
*   **Hook Type:** `beforeAction`
*   **Objective:** Scans shell input text strings for dangerous commands (e.g., `rm -rf`, `drop database`) and securely intercepts execution before it hits your host operating system terminal.

### 2. Self-Healing Git Auto-Commit (`/mods/git-auto-commit.md`)
*   **Hook Type:** `afterAction`
*   **Objective:** Activates automatically whenever a file is created or changed. It verifies the local directory state, runs a silent `git init` if needed, stages the assets via `git add .`, and commits the payload using structured **Conventional Commit** formatting.

### 3. API Key Censor & PII Masker (`/mods/api-key-censor.md`)
*   **Hook Type:** `afterAction`
*   **Objective:** Intercepts files and tool outputs to automatically censor sensitive authorization strings (like `sk-proj-...` or private keys) with `[CENSOR_MOD_REDACTED]` before they get committed to workspace logs.

### 4. Code Style & Quality Enforcer (`/mods/style-guide-enforcer.md`)
*   **Hook Type:** `beforeAction`
*   **Objective:** Reviews proposed code modifications to verify adherence to modern stylistic benchmarks (e.g., Python PEP-8 rules, ES6 syntax rules) and ensures proper docstrings are populated automatically.

---

## 🤝 How to Create & Contribute Your Custom Mods

OpenMod is built to be decentralized. Anyone can build a mod without writing code. 

To submit a mod to our public ecosystem marketplace:
1. Fork this repository on GitHub.
2. Create a new markdown rule file in the `/mods` directory using this exact structural layout:

```markdown
# Mod: [Your Mod Name]
# Namespace: openmod.[category].[modname]
# Hook: [beforeAction OR afterAction]

## 🎯 Target Triggers
- [Describe the event that triggers this mod]

## ⚙️ Mod Logic
- [State the exact programmatic or behavioral rules the AI must enforce]
```
3. Submit a Pull Request (PR) from your GitHub mobile app or browser interface to merge your logic block into our global registry!
