# 🛡️ Mod: Destructive Terminal Guardrail
# Namespace: openmod.security.guardrail
# Hook: beforeAction

## 🎯 Target Triggers
- Any intent to run system shell commands, code execution pipelines, or terminal actions (`bash`, `zsh`, `cmd`, `execute_command`, `run_code`).

## 🛑 Constraint Logic
- Evaluate the command string for hazardous or destructive arguments before passing it to the host environment.
- **Prohibited Phrases:** `rm -rf`, `drop database`, `mkfs`, `sudo rm`, `:(){ :|:& };:`, `format c:`

## ⚡ Execution Interception
- **IF SAFE:** Pass the command forward exactly as intended.
- **IF PROHIBITED:** Instantly terminate the execution loop. Do not communicate with the host operating system terminal. Respond to the user interface with this exact string:
  `[OPENMOD INTERCEPTED]: Execution denied by openmod.security.guardrail. Reason: Destructive system pattern detected.`
