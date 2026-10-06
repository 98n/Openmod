#!/bin/bash

# OpenMod Workspace Setup Engine
echo "🚀 Initializing OpenMod Workspace Setup..."

# 1. Define repo pathing (Replace with your actual GitHub username)
REPO_RAW_URL="https://githubusercontent.com"

# 2. Check for an existing IDE rules file
if [ -f ".cursorrules" ]; then
    TARGET_FILE=".cursorrules"
elif [ -f ".windsurfrules" ]; then
    TARGET_FILE=".windsurfrules"
else
    TARGET_FILE=".cursorrules"
    touch .cursorrules
fi

echo "📂 Target IDE configuration profile detected: $TARGET_FILE"

# 3. Pull down the core architecture framework
echo "🧠 Injecting OpenMod Core Engine..."
curl -s "$REPO_RAW_URL/openmod-core.md" >> "$TARGET_FILE"
echo -e "\n\n" >> "$TARGET_FILE"

# 4. Pull down and inject chosen active marketplace mods
echo "🛡️ Injecting active marketplace mods..."
curl -s "$REPO_RAW_URL/mods/security-guardrail.md" >> "$TARGET_FILE"
echo -e "\n\n" >> "$TARGET_FILE"
curl -s "$REPO_RAW_URL/mods/api-key-censor.md" >> "$TARGET_FILE"
echo -e "\n\n" >> "$TARGET_FILE"
curl -s "$REPO_RAW_URL/mods/style-guide-enforcer.md" >> "$TARGET_FILE"

echo "✅ OpenMod has successfully mounted middleware interceptors inside your IDE workspace!"
