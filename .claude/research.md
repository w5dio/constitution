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

---

## Programmatic Output Consumption Options

Options considered for machine-readable access to provisioning outputs, all rejected in favour of manual human-readable output via the GitHub Actions job summary.

- **Terraform remote state:** requires the consumer to also use Terraform — a dealbreaker for clients that should need no IaC tooling
- **SSM Parameter Store:** clients need AWS credentials just to read a value, introducing an AWS dependency for unrelated consumers
- **Shared state repo / output file committed to a repo:** pollutes git history with machine-generated commits; concurrency risk; conflates human intent (config) with machine state (outputs)
- **HCP Terraform API:** workable but against the grain — HCP Terraform is not designed for cross-system output distribution
- **Purpose-built outputs store:** cleanest interface, but requires building and hosting a new service
