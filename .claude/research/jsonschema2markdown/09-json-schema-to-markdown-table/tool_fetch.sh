#!/bin/bash

dir=upstream
[[ -d "$dir" ]] && echo "Directory '$dir' already exists, exiting" && exit 1
mkdir "$dir"
wget -P "$dir" -nv \
  https://cdn.jsdelivr.net/npm/json-schema-to-markdown-table@0.4.0/json-schema-to-markdown.js \
  https://cdn.jsdelivr.net/npm/json-schema-to-markdown-table@0.4.0/index.js \
  https://cdn.jsdelivr.net/npm/json-schema-to-markdown-table@0.4.0/.npmignore \
  https://cdn.jsdelivr.net/npm/json-schema-to-markdown-table@0.4.0/LICENSE \
  https://cdn.jsdelivr.net/npm/json-schema-to-markdown-table@0.4.0/package.json \
  https://cdn.jsdelivr.net/npm/json-schema-to-markdown-table@0.4.0/README.md
