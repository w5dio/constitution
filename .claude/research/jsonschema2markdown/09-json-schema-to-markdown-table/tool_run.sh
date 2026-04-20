#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TOOL_DIR="$SCRIPT_DIR/upstream"

[[ -f output.md || -d output ]] && echo "Output already exists, exiting" && exit 1
node -e "
const { render } = require('$TOOL_DIR');
const schema = require('$SCRIPT_DIR/../example.schema.json');
console.log(render(schema));
" > "$SCRIPT_DIR/output.md"
