# Research — Platypus

Background research collected during development. Internal for now, with the option to promote to an official project file (e.g. a repo wiki) when a permanent home is decided.

---

## Service Repository File Roles

Each file in a fully developed service repository can be characterised along multiple axes.

**Axis 1: Provenance** — where does the file come from?

| Framework-provided                 | Developer-provided                     |
|:-----------------------------------|:---------------------------------------|
| `AGENTS.md`, Workflow file, README | Config, Config Schema, Terraform files |

> Note: framework-provided files are installed by the framework in a service repository. Developer-provided files are created by the service developer during the development of the service.

**Axis 2: Lifecycle** — when is the file used?

| Dev-time    | Runtime                                                       |
|:------------|:--------------------------------------------------------------|
| `AGENTS.md` | Config, Config Schema, Terraform files, Workflow file, README |

**Axis 3: Audience** — who is the file for?

| Service developer                                          | Service user   |
|:-----------------------------------------------------------|:---------------|
| `AGENTS.md`, Config Schema, Terraform files, Workflow file | Config, README |

---

## JSON Schema to Markdown Conversion Tool Evaluation

> Note: full research output in [`jsonschema2markdown/`](jsonschema2markdown).

Background research for the service docs generation (service README) from the service's JSON schema. The goal is to get an overview how the information in a JSON schema is commonly structured and represented in Markdown documents.

This research evaluates a set to JSON Schema to Markdown conversion tools by running them locally and inspecting their input. The criterion for including a tool is that it can take a JSON schema as input and produce a Markdown file as output.

### Output categories

- **Hierarchical:** the output mirrors the schema's nesting structure. Fields are presented as nested sections, nested tables, or a combination thereof.
- **Flat:** all fields are listed in a single flat table regardless of nesting depth, with nesting expressed via dot-notation in the property name column (e.g. `items[].mode.strategy`).

### Tool Evaluation Results

> Note: all GitHub data (stars, number of commits, etc.) has been retrieved on 2026-04-19.

#### 1. [`prmd`](https://github.com/interagent/prmd) (Ruby)

- GitHub: 2,093 stars | 636 commits | last: 2025-02-06 (14 months ago)
- Output category: flat
- Requires a specific combined schema format based on JSON Hyper-Schema draft-04 — not standard JSON Schema. Each resource must be defined under `definitions` with `links` (HTTP endpoints), field-level `definitions`, and `properties` referencing those definitions. Does not accept a plain JSON Schema file.
- Purpose-built for REST API documentation: output includes HTTP method/path blocks, curl examples, and response examples — none of which are relevant for config schema documentation.
- Schema structure is flat: nesting must be manually collapsed into dot-notation field names (e.g. `mode.settings.timeout` → `mode_settings_timeout`). No support for nested objects.
- Output table columns: **Name**, **Type**, **Description**, **Example** — but requires `example` to be defined in the schema (not `examples` as in JSON Schema 2020-12).
- Does not work with the original `config.schema.json` — requires a hand-crafted adapter schema.

#### 2. [`json-schema-for-humans`](https://github.com/coveooss/json-schema-for-humans) (Python)

- GitHub: 732 stars | 448 commits | last: 2026-04-14 (less than 1 week ago)
- Output category: hierarchical
- Each field gets a section with a metadata table listing its attributes
- Table columns: Title, Description, Type, Required, Default, Examples, Pattern, Deprecated, Definition (and more) — all columns always present even when empty
- Handles full nesting, `enum` values, required/optional status, `examples`, `additionalProperties`
- The array item type heading is awkward ("items items") when the array item schema has no title
- Also has HTML/JavaScript templates (`js`, `js_offline`) which produce richer, more polished output than the Markdown templates

#### 3. [`@adobe/jsonschema2md`](https://github.com/adobe/jsonschema2md) (Node.js)

- GitHub: 715 stars | 1,411 commits | last: 2026-04-14 (less than 1 week ago)
- Output category: hierarchical
- Multi-file output: generates one `.md` file per schema object and per property (12 files for our schema), designed for static site generators (Jekyll, GitHub Pages)
- Root file covers only top-level fields; all nested content is in sibling files linked by relative paths
- Root file includes a header table with columns: Abstract, Extensible, Status, Identifiable, Custom Properties, Additional Properties, Access Restrictions, Defined In
- Each field section includes: type, required/optional, nullable, and a "defined in" cross-link to the sibling file
- Does not support 2020-12 — `$schema` had to be stripped from the input to avoid a crash

#### 4. [`wetzel`](https://github.com/CesiumGS/wetzel) (Node.js)

- GitHub: 137 stars | 174 commits | last: 2022-07-18 (3 years 9 months ago)
- Output category: hierarchical
- Single-file output to stdout
- Each field subsection includes: type, required, enum values, default, and numeric/string constraints
- Only follows `$ref` references to resolve nested schemas — does not recurse into inline nested object properties; for our schema, only the root object is documented
- Supports 2020-12 natively (also drafts 3, 4, 7)

#### 5. [`jsonschema-markdown`](https://github.com/elisiariocouto/jsonschema-markdown) (Python)

- GitHub: 35 stars | 150 commits | last: 2026-03-25 (less than 1 month ago)
- Output category: flat
- Single flat table covering all fields across all nesting levels
- Table columns: Property, Type, Required, Possible values, Deprecated, Default, Description, Examples
- `enum` fields show all allowed values in the Possible values column; the Type column shows `None` when no `type` keyword is present (only `enum`)

#### 6. [`json-schema-static-docs`](https://github.com/tomcollins/json-schema-static-docs) (Node.js)

- GitHub: 31 stars | 298 commits | last: 2025-01-06 (15 months ago)
- Output category: hierarchical
- Each field gets a section with a vertical HTML table listing its attributes — only rows for attributes that are present in the schema, no empty rows
- Table rows (when present): $id, Deprecated, Title, Description, Type, Required, Default, Read Only, Write Only, Const, Enum, constraints, Format, Pattern, Examples
- Nesting expressed via dot notation in section headings (e.g. `items.mode.strategy`)

#### 7. [`json-schema-to-markdown`](https://github.com/saibotsivad/json-schema-to-markdown) (Node.js)

- GitHub: 30 stars | 30 commits | last: 2019-06-26 (6 years 10 months ago)
- Output category: hierarchical
- Sections are nested to mirror the schema structure, with type and required status appended in parentheses to each heading (e.g. `` `strategy` (enum, required) ``)
- Very compact — section body contains only the description, followed by enum values, default, and constraints if present; no tables or additional metadata
- [`jsonschema-2-markdown`](https://github.com/hugorper/jsonschema-2-markdown) (1 star, last commit 2018) is a direct fork with identical output; only additions are cosmetic refactoring and a document template wrapper

#### 8. [`jsonschema2mk`](https://github.com/simonwalz/jsonschema2mk) (Node.js)

- GitHub: 10 stars | 131 commits | last: 2026-03-29 (less than 1 month ago)
- Output category: hierarchical
- Each schema object and array gets its own section; scalar properties are rows in the section's properties table
- Table columns: Name, Type, Description, Required
- Constraints and enum values are inlined into the Description cell
- Also generates a JSON example block for each section

#### 9. [`json-schema-to-markdown-table`](https://www.jsdelivr.com/package/npm/json-schema-to-markdown-table) (Node.js)

- Output category: flat
- Single flat table covering all fields across all nesting levels
- Table columns: Name, Type, Description
- Optional fields are indicated by an `*Optional*` prefix in the Description column; no enum values, defaults, or constraints included

### Conclusions

- TODO

---

## Programmatic Output Consumption Options

Options considered for machine-readable access to provisioning outputs, all rejected in favour of manual human-readable output via the GitHub Actions job summary.

- **Terraform remote state:** requires the consumer to also use Terraform — a dealbreaker for clients that should need no IaC tooling
- **SSM Parameter Store:** clients need AWS credentials just to read a value, introducing an AWS dependency for unrelated consumers
- **Shared state repo / output file committed to a repo:** pollutes git history with machine-generated commits; concurrency risk; conflates human intent (config) with machine state (outputs)
- **HCP Terraform API:** workable but against the grain — HCP Terraform is not designed for cross-system output distribution
- **Purpose-built outputs store:** cleanest interface, but requires building and hosting a new service

---

## JSON Schema 2020-12 keyword reference

Source documents: `draft-bhutton-json-schema-01` (core spec), `draft-bhutton-json-schema-validation-01` (validation companion spec).

### Annotation keywords

Annotation keywords are added directly in any schema object (at root level or on any field), alongside validation keywords. They have no effect on validation — they are purely informational, used by tooling to produce documentation.

| Keyword | Type |
|---|---|
| `title` | string |
| `description` | string |
| `default` | any |
| `deprecated` | boolean |
| `readOnly` | boolean |
| `writeOnly` | boolean |
| `examples` | array |

> Source: `draft-bhutton-json-schema-validation-01`, section 9 (Meta-Data vocabulary)

### Validation keywords

Validation keywords are added directly in any schema object alongside annotation keywords. They assert constraints on the instance value — validation fails if a constraint is not satisfied.

Type assertion keywords — every schema object must have one:

| Keyword | Valid values |
|---|---|
| `type` | `"array"`, `"boolean"`, `"integer"`, `"null"`, `"number"`, `"object"`, `"string"` (or an array of these) |
| `enum` | An array of allowed values of any type |
| `const` | Any single value |

Constraint keywords — each category only applies to fields of the corresponding type:

| Category | Keywords |
|---|---|
| Number constraints | `multipleOf`, `maximum`, `exclusiveMaximum`, `minimum`, `exclusiveMinimum` |
| String constraints | `maxLength`, `minLength`, `pattern` |
| Array constraints | `maxItems`, `minItems`, `uniqueItems`, `maxContains`, `minContains` |
| Object constraints | `maxProperties`, `minProperties`, `required`, `dependentRequired` |

> Source: `draft-bhutton-json-schema-validation-01`, section 6

### Format keywords

The `format` keyword is added to a `string` field with one of the following spec-defined values (e.g. `"format": "uri"`). By default it is an annotation only (no effect on validation); it can be configured as an assertion by declaring the Format-Assertion vocabulary.

| Category | Values |
|---|---|
| Dates & times | `date-time`, `date`, `time`, `duration` |
| Email | `email`, `idn-email` |
| Hostnames | `hostname`, `idn-hostname` |
| IP addresses | `ipv4`, `ipv6` |
| Resource identifiers | `uri`, `uri-reference`, `iri`, `iri-reference`, `uuid` |
| URI template | `uri-template` |
| JSON pointers | `json-pointer`, `relative-json-pointer` |
| Regular expressions | `regex` |

> Source: `draft-bhutton-json-schema-validation-01`, section 7.3

