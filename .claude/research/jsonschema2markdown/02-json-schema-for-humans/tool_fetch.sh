#!/bin/bash

dir=upstream
sha=80ddee9186c9b2f451e2cea2f1985cfa43173ae4  # commit used for the tool evaluation
[[ -d "$dir" ]] && echo "Directory '$dir' already exists, exiting" && exit 1
git clone --no-checkout https://github.com/coveooss/json-schema-for-humans "$dir"
git -C "$dir" checkout "$sha"
