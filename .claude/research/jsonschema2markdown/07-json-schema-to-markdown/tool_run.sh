#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TOOL_DIR="$SCRIPT_DIR/upstream"

# Install dependencies if needed
if [ ! -d "$TOOL_DIR/node_modules" ]; then
  (cd "$TOOL_DIR" && npm install)
fi

[[ -f output.md || -d output ]] && echo "Output already exists, exiting" && exit 1
node -e "
const parse = require('$TOOL_DIR');
const schema = require('$SCRIPT_DIR/../example.schema.json');
console.log(parse(schema));
" > "$SCRIPT_DIR/output.md"
