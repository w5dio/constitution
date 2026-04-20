Complete rewrite of the example schema to satisfy prmd's JSON Hyper-Schema draft-04 format:

- `$schema` set to `http://json-schema.org/draft-04/hyper-schema`
- Added `id` and root-level `links` (required by prmd)
- Nested object hierarchy collapsed to flat dot-notation property names (e.g. `mode_strategy`, `mode_settings_timeout`)
- `examples` replaced with `example` (singular, prmd requirement)
- Types expressed as arrays (e.g. `["string"]`)
- HTTP endpoint `links` added per resource (required for prmd output)
