#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TOOL_DIR="$SCRIPT_DIR/upstream"

[[ -f output.md || -d output ]] && echo "Output already exists, exiting" && exit 1
(cd "$TOOL_DIR" && uv run jsonschema-markdown "$SCRIPT_DIR/../example.schema.json") > "$SCRIPT_DIR/output.md"
