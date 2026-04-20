#!/bin/bash

dir=upstream
sha=9c6ebde2e693387fda8ceaac1149db7f19c3b06f  # commit used for the tool evaluation
[[ -d "$dir" ]] && echo "Directory '$dir' already exists, exiting" && exit 1
git clone --no-checkout https://github.com/simonwalz/jsonschema2mk "$dir"
git -C "$dir" checkout "$sha"
