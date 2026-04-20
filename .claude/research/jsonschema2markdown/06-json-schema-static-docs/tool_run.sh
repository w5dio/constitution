#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TOOL_DIR="$SCRIPT_DIR/upstream"

# Install dependencies if needed
# package-lock.json is deleted because it was generated on a DVLA machine and has all resolved
# URLs pointing to an internal DVLA registry, causing npm install to hang on timeout.
if [ ! -d "$TOOL_DIR/node_modules" ]; then
  (cd "$TOOL_DIR" && rm -f package-lock.json && npm install --registry https://registry.npmjs.org && npm install --registry https://registry.npmjs.org fast-uri)
fi
[[ -f output.md || -d output ]] && echo "Output already exists, exiting" && exit 1

(cd "$SCRIPT_DIR" && node upstream/cli.js -i schema -o output)
