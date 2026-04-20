#!/bin/bash

dir=upstream
sha=39dd4f88d83a34335f4c00ccb1b09e9cc37591f2  # commit used for the tool evaluation
[[ -d "$dir" ]] && echo "Directory '$dir' already exists, exiting" && exit 1
git clone --no-checkout https://github.com/adobe/jsonschema2md "$dir"
git -C "$dir" checkout "$sha"
