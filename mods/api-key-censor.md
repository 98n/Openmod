# 🔒 Mod: API Key Censor & PII Masker
# Namespace: openmod.security.censor
# Hook: afterAction

## 🎯 Target Triggers
- Any tool response, file read operation, terminal log, or console output displayed within the IDE chat window or terminal panel.

## ⚙️ IDE Mod Logic
- Scan all generated or retrieved data blocks for sensitive text patterns before rendering them to the user or adding them to the context window history.
- **Target Patterns:**
  - OpenAI API Keys (`sk-proj-...`)
  - Anthropic API Keys (`sk-ant-...`)
  - Generic Secrets/Passwords (e.g., `STRIPE_SECRET_KEY=...`, `AWS_SECRET_ACCESS_KEY=...`)
- **Action Required:** Intercept the text and automatically replace the sensitive string entirely with `[CENSOR_MOD_REDACTED]` to eliminate data leaks.
