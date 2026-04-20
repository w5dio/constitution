#!/bin/bash
set -e

for dir in [0-9][0-9]-*/; do
  echo "Fetching $dir..."
  (cd "$dir" && ./tool_fetch.sh)
done
