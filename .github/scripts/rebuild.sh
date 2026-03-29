#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for ArbitrumFoundation/docs
# Runs on existing source tree (no clone). Installs deps, runs pre-build steps, builds.

# --- Node version ---
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
    # shellcheck source=/dev/null
    . "$NVM_DIR/nvm.sh"
    nvm use 20 || nvm install 20
fi

# --- Package manager + dependencies ---
# Uses yarn (yarn.lock exists)
yarn install --frozen-lockfile

# --- Build ---
yarn build

echo "[DONE] Build complete."
