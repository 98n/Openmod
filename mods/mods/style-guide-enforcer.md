# 🎨 Mod: Code Style & Quality Enforcer
# Namespace: openmod.style.formatter
# Hook: beforeAction

## 🎯 Target Triggers
- Any inline code generation, file creation, or code replacement tool call targeting languages like Python, JavaScript, TypeScript, or Go.

## ⚙️ IDE Mod Logic
- Review the planned file-write payloads for compliance with clean code standards before writing to disk.
- **Enforcement Checklist:**
  - **Python:** Strict PEP-8 conventions (snake_case functions, 4-space indentation).
  - **JS/TS:** Modern ES6+ formatting (const/let over var, camelCase variables).
  - **All Languages:** Every public function/class must automatically include a clear, concise docstring/comment explaining its purpose.
- **Action Required:** If code violates these criteria, silently refactor and clean the syntax within your internal reasoning stage before passing the clean payload to the IDE file write utility.
