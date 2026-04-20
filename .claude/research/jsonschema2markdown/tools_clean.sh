#!/bin/bash

for dir in [0-9][0-9]-*/; do
  echo "Cleaning $dir..."
  rm -rf "$dir/upstream" "$dir/output.md" "$dir/output"
done
