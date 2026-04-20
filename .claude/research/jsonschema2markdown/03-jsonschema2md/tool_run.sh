#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TOOL_DIR="$SCRIPT_DIR/upstream"
SCHEMA_DIR="$SCRIPT_DIR/schema"
OUTPUT_DIR="$SCRIPT_DIR/output"

# Install dependencies if needed
if [ ! -d "$TOOL_DIR/node_modules" ]; then
  (cd "$TOOL_DIR" && npm install)
fi

[[ -f output.md || -d output ]] && echo "Output already exists, exiting" && exit 1
mkdir -p "$OUTPUT_DIR"
node "$TOOL_DIR/cli.js" -d "$SCHEMA_DIR" -o "$OUTPUT_DIR" -x -
