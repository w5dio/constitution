#!/bin/bash

dir=upstream
sha=f30c4fb4655facfcf91fca745f6188d5646c3f21  # commit used for the tool evaluation
[[ -d "$dir" ]] && echo "Directory '$dir' already exists, exiting" && exit 1
git clone --no-checkout https://github.com/CesiumGS/wetzel "$dir"
git -C "$dir" checkout "$sha"
