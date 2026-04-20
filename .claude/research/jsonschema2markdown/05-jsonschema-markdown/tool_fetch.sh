#!/bin/bash

dir=upstream
sha=ce2f13876f76991326bab74e493197fffe6ad001  # commit used for the tool evaluation
[[ -d "$dir" ]] && echo "Directory '$dir' already exists, exiting" && exit 1
git clone --no-checkout https://github.com/elisiariocouto/jsonschema-markdown "$dir"
git -C "$dir" checkout "$sha"
