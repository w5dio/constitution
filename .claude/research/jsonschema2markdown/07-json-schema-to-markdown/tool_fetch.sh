#!/bin/bash

dir=upstream
sha=7fdb25750cd0acf5ef4453384e1c3eed3e22b4ac  # commit used for the tool evaluation
[[ -d "$dir" ]] && echo "Directory '$dir' already exists, exiting" && exit 1
git clone --no-checkout https://github.com/saibotsivad/json-schema-to-markdown "$dir"
git -C "$dir" checkout "$sha"
