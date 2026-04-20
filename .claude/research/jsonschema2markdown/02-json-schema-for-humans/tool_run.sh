#!/bin/bash
[[ -f output.md || -d output ]] && echo "Output already exists, exiting" && exit 1
mkdir -p output
generate-schema-doc --config template_name=md ../example.schema.json output/md.md
generate-schema-doc --config template_name=md_nested ../example.schema.json output/md_nested.md
generate-schema-doc --config template_name=md --config "template_md_options={\"badge_as_image\": true}" ../example.schema.json output/md-badges.md
generate-schema-doc --config template_name=md_nested --config "template_md_options={\"badge_as_image\": true}" ../example.schema.json output/md_nested-badges.md
