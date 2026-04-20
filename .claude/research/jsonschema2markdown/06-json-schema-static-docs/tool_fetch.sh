#!/bin/bash

dir=upstream
sha=49bd2722b29f02cef2a21efc27f1eb1605374745  # commit used for the tool evaluation
[[ -d "$dir" ]] && echo "Directory '$dir' already exists, exiting" && exit 1
git clone --no-checkout https://github.com/tomcollins/json-schema-static-docs "$dir"
git -C "$dir" checkout "$sha"
