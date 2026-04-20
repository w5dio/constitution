#!/bin/bash

dir=upstream
sha=5f463e021a4573f1cf09a1932dc990d9d03bcddc  # commit used for the tool evaluation
[[ -d "$dir" ]] && echo "Directory '$dir' already exists, exiting" && exit 1
git clone --no-checkout https://github.com/interagent/prmd "$dir"
git -C "$dir" checkout "$sha"
