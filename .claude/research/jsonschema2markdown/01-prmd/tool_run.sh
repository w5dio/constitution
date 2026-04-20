#!/bin/bash
# Note: tool requires specific schema format and fails with example schema in ../example.schema.json
[[ -f output.md || -d output ]] && echo "Output already exists, exiting" && exit 1
/opt/homebrew/lib/ruby/gems/3.4.0/bin/prmd doc schema/example.schema.json >output.md
