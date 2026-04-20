#!/bin/bash
set -e

for dir in [0-9][0-9]-*/; do
  echo "Running $dir..."
  (cd "$dir" && ./tool_run.sh)
done
