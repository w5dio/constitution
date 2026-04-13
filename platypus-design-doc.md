# Platypus: Design Document

This document captures the design of the Platypus platform. It is input for implementation, not a final reference document.

---

## Overview

Platypus is a self-service infrastructure provisioning platform intended for use across all domains (weibeld, W5D Labs, Rye & Cheese, w5d.io). Users define desired infrastructure as a declarative config; the platform takes care of provisioning and operating the infrastructure.

The platform is named Platypus. Individual units are called services. Each service is maintained in a separate repository, prefixed with `plat-` followed by the service name (e.g. `plat-domain`). The platform's own repository is named `platypus`.

The `platypus` repo is a static file registry — it contains no runtime logic of its own. It holds two sets of files intended to be copied into a service repo: platform files that define what a service is and how it operates, and an example service as an optional starting point. All actual platform functionality is implemented in the individual service repos.

Service development is driven by a coding agent. The platform is not tied to any specific agent — `AGENTS.md` is used as the instructions file because it is an emerging cross-agent standard, and its content is plain Markdown with no agent-specific syntax. For compatibility with a specific agent, it is the developer's responsibility to configure their agent to read `AGENTS.md` (e.g. by pointing `CLAUDE.md` or `GEMINI.md` at it, or by renaming the file).

---

## platypus Repo Contents

The repo contains two sets of files and two scripts that copy them into a service repo.

### File Structure

```
install              ← installs platform files into the service repo (safe to re-run)
example              ← copies the example service into the repo (one-time, optional)
README.md            ← describes the repo and the service init workflow
DECISIONS.md         ← permanent record of architectural and technology decisions
install/
  AGENTS.md          → root of service repo
  Makefile           → root of service repo
  jsonschema2readme.sh    → root of service repo
  .github/
    workflows/
      run.yml        → .github/workflows/ of service repo
example/
  config.yaml        → root of service repo
  config.schema.json → root of service repo
  main.tf            → root of service repo
  variables.tf       → root of service repo
  outputs.tf         → root of service repo
```

Once the repo is implemented, this design document is no longer needed. `README.md` covers the Overview, platypus Repo Contents, and Service Development sections; `DECISIONS.md` is extracted from the Architectural Decisions and Technology Choices sections and kept as a permanent record.

### install

Copies all files from `install/` into the service repo, mirroring the directory structure. Safe to re-run — on subsequent runs only the platform section of `AGENTS.md` (between the sentinel markers) is updated; all other managed files are overwritten in full.

Before copying, checks that all tools required by the Makefile are installed and aborts with a clear error message if any are missing.

### example

Copies all files from `example/` into the service repo. Intended to be run once as an optional starting point. If any target files already exist, lists the conflicts and prompts for confirmation (`[y/N]`) before overwriting — defaulting to no.

### AGENTS.md

Contains the platform instructions read by the coding agent at session start. Has two sections:

- **Platform section** (marked with sentinel comments, DO NOT EDIT): platform-wide instructions and conventions, maintained centrally
- **Service-specific section** (stub at the bottom): the service developer adds context about their specific service here

On re-run of `install`, only the platform section (between the sentinel markers) is updated; the service-specific section is left untouched.

### Makefile

Provides the standard developer commands, consistent across all services:

| Command | Description |
|---|---|
| `make readme` | Regenerate `README.md` from `config.schema.json` |
| `make validate` | Validate `config.yaml` against `config.schema.json` |

Terraform commands (`terraform validate`, `terraform plan`, etc.) are run directly — no Make wrapper needed since Terraform files live at the repo root.

### jsonschema2readme.sh

Called by `make readme`. Generates `README.md` from `config.schema.json` using the schema's root `title` and `description` fields as the README heading and introductory paragraph, with a full config reference derived from field-level annotations. Wraps an existing JSON Schema documentation tool with custom logic for the overall README structure.

> **TBD:** tooling — candidates are `json-schema-for-humans` (Python) and `@adobe/jsonschema2md` (npm)

### run.yml

The GitHub Actions workflow. Fully managed — must not be edited by the service developer.

Responsible for:

- Running Terraform
- Reading all Terraform output values defined in the service's `outputs.tf`
- Formatting and publishing them to the GitHub Actions job summary in a consistent, platform-defined format

### Example Service

The files in `example/` form a minimal runnable Platypus service. They demonstrate the complete pattern end to end — declarative config read via `yamldecode()`, a resource provisioned per config entry, and outputs exposed via `outputs.tf` and published to the job summary by the managed workflow — so a developer can see the full flow immediately before replacing the content with their real implementation.

---

## Service Development

How a developer uses the `platypus` repo to create and develop a service.

### Init Workflow

To create a new Platypus service repo:

1. `mkdir plat-<name> && cd plat-<name> && git init`
2. `curl https://raw.githubusercontent.com/w5dio/platypus/refs/heads/main/install | bash` — installs platform files
3. Optionally: `curl https://raw.githubusercontent.com/w5dio/platypus/refs/heads/main/example | bash` — copies the example service as a starting point
4. Start the coding agent — it reads `AGENTS.md` at session start and guides all implementation from there

To update platform files at any time: re-run `install`.

> **Note:** the raw GitHub URLs above are intended to be replaced by short URLs once the `plat-shorturl` service is deployed (e.g. `w5d.io/platypus/install` and `w5d.io/platypus/example`).

### Config

- Each service has exactly one config file, named `config.yaml`, located in the root of the repo
- The config is declarative — it describes the desired state, and the service ensures the actual state matches it
- The format is YAML
- Each service must have a JSON Schema for its `config.yaml`
- Every resource in the config must be something the service directly creates and manages — resources managed outside the platform have no place in service config
- The fields and their meaning in the config file are determined by the service developer

### Implementation

- Provisioning is implemented with Terraform; Terraform files live at the repo root
- HCP Terraform is used for storing Terraform state
- Terraform reads `config.yaml` via `yamldecode()` — the user is completely decoupled from Terraform concepts and provider-specific naming
- All automated execution runs on GitHub Actions via the managed `run.yml` workflow

### Output

- The service developer declares what outputs to expose by defining them in `outputs.tf`
- The managed `run.yml` workflow reads these values, formats them, and publishes them to the GitHub Actions job summary automatically
- Output is for human consumption; apps do not read platform outputs at runtime

### Documentation

- `config.schema.json` is the single source of truth for both the config contract and all user-facing documentation
- `README.md` is auto-generated from `config.schema.json` by running `make readme`; it is never manually authored
- The schema's root `title` and `description` fields provide the README heading and introductory paragraph; all other content is derived from field-level annotations
- Field-level `description`, `examples`, and `default` annotations are **mandatory**

### Secrets

> **TBD:** how secrets are managed (likely GitHub Secrets, but not yet decided)

### Resilience

- The provisioning state is periodically validated and automatically corrected if it differs from the desired state in config
- Validation and correction are done with Terraform; periodic executions are scheduled with GitHub Actions

> **TBD:** determine whether to include resilience at all — it can be seen as an optional add-on. If included, the frequency of periodic runs must also be determined (platform-wide fixed value vs. configured per service).

---

## Architectural Decisions

Deliberate choices about the scope, shape, and direction of the platform — what it is, what it does, and what it explicitly does not do.

### Platform Purpose: Provisioning vs. Inventory

**Decision:** provisioning only. Every resource in a service's config must be something the service directly creates and manages.

Two fundamentally different purposes are possible for a platform that manages infrastructure:

**Provisioning**

- The platform creates and manages resources according to a declarative config
- The config is prescriptive — it defines what should exist, and the platform makes it so
- Every item in the config is owned by the platform; the platform is the single source of truth for its state
- The scope is strictly bounded: if it's not in the config, the platform doesn't know about it

**Inventory**

- The platform maintains a record of what resources and services exist, including those created and managed outside the platform
- The config is descriptive — it documents reality rather than prescribing it
- Items in the config may be managed by other tools, teams, or processes; the platform has no control over them
- The scope is unbounded: anything that exists can in principle be listed

Platypus focuses exclusively on provisioning. Mixing inventory into the same config introduces irresolvable conflicts: a provisioning platform must be able to act on its config (create, update, delete resources), but acting on inventory items it doesn't own would be destructive. Keeping the two concerns separate avoids this entirely.

> Note: the inventory concern may be addressed in a separate future project (initial ideas in [w5dio/inventory](https://github.com/w5dio/inventory)) that discovers resources by querying live systems — purely read-only, no config required, and entirely unrelated to Platypus.

### Service Lifecycle: On-Demand Provisioning vs. Shared Infrastructure

**Decision:** on-demand provisioning only.

**On-demand provisioning**

- Infrastructure is provisioned on request for a specific app or user
- The lifecycle of the provisioned infrastructure is determined by the app or user that requested it
- To provision or modify infrastructure, the user edits the config of the corresponding platform service
- Users actively interact with the platform — it is visible and central to their workflow

**Shared infrastructure**

- Infrastructure is provisioned independently of any concrete request and is meant to be shared by any app or user that wants to use it
- The lifecycle of the infrastructure is determined by the platform operator, not by individual users
- Users or apps access the infrastructure directly (e.g. via a URL) without going through the platform
- The platform is invisible to users in practice — it is only touched for operational changes that affect the infrastructure as a whole

Platypus provides on-demand provisioning only. A unified platform framework only provides value when users actively interact with it.

> Note: shared infrastructure will be maintained as standalone repositories in the w5d.io GitHub organisation, outside of the Platypus project.

### Usage Mode: Manual vs. Programmatic

**Decision:** manual.

- **Config editing:** a developer edits `config.yaml` by hand; no program writes to it
- **Output reading:** a developer reads outputs from the GitHub Actions job summary and manually wires relevant values into app config; no program reads platform outputs at runtime

Rejected alternative — dynamic/programmatic usage:
- Introduces excessive complexity, coupling, and failure vectors for a modest gain
- Options considered for dynamic/programmatic output consumption:
  - **Terraform remote state:** requires the client to also use Terraform (dealbreaker: clients should need no IaC tooling)
  - **SSM Parameter Store:** clients need AWS credentials just to read a value (introduces an AWS dependency for unrelated clients)
  - **Shared state repo/output file committed to a repo:** pollutes git history with machine-generated commits; concurrency risk; conflates human intent (config) with machine state (outputs)
  - **HCP Terraform API:** workable but against the grain — HCP Terraform is not designed for cross-system output distribution
  - **Purpose-built outputs store:** cleanest interface, but requires building and hosting a new service

### Config Format: Custom YAML vs. IaC Config

**Decision:** custom YAML.

Rejected alternative — Terraform HCL directly:
- Requires the user to know HCL syntax and Terraform concepts
- Ties the config format to Terraform; switching provisioning tools would require rewriting user-facing config
- Higher barrier to entry; harder to read at a glance

### Output Surface: GitHub Actions Job Summary vs. Key-Value Store

**Decision:** GitHub Actions job summary.

**GitHub Actions job summary**

- No new dependency and no additional service to build or maintain
- Exposes an internal implementation detail (GitHub Actions) to the user
- The user must navigate the GitHub Actions UI to find the output

**Hosted key-value store**

- Fully abstracts away the internal implementation
- Extensible: could support a future GUI or dashboard
- Requires building a new service or taking on an external dependency

The job summary was chosen for its simplicity and zero additional infrastructure.

> Note: the key-value store remains an option for a future version, particularly if a more polished output UX becomes a priority.

---

## Technology Choices

### IaC Tool: Terraform

**Decision:** all IaC in the platform uses Terraform.

- **Terraform:** industry standard, declarative HCL, excellent provider ecosystem (including Cloudflare), plan/apply is a natural validation/remediation mechanism
- **OpenTofu:** functionally identical but no managed state service comparable to HCP Terraform's free tier
- **Pulumi:** uses real programming languages but is overkill for config-level IaC
- **Ansible:** procedural, not truly declarative, no state model
- **Direct API scripts:** no declarative or plan/diff benefits

### Terraform State Storage: HCP Terraform

**Decision:** all Terraform state is stored in HCP Terraform.

- **Local file:** not accessible from GitHub Actions — ruled out
- **Git:** state can contain secrets, causes messy diffs
- **S3 + DynamoDB:** viable but requires managing AWS credentials in GitHub Actions solely for state access
- **HCP Terraform:** free tier covers unlimited state storage and up to 500 managed resources, clean integration via `hashicorp/setup-terraform`, handles state locking out of the box

### Automation Platform: GitHub Actions

**Decision:** all automated workflows run on GitHub Actions.

Natively supports all three required triggers: on config change (push), periodically (schedule), and on demand (workflow_dispatch).

- **GitHub Actions:** native to GitHub, free hosted runners, no additional integration needed
- **VPS + cron:** no native git trigger, no audit trail, requires maintaining a server
- **Other CI platforms (CircleCI, Jenkins, Buildkite etc.):** require external integration since code lives on GitHub
- **Serverless schedulers (AWS EventBridge + Lambda, GCP Cloud Scheduler + Cloud Run, etc.):** none natively support the git push trigger without additional wiring

### Documentation Generation Tooling

> **TBD:** tooling for `jsonschema2readme.sh`.

Options considered:

- **`json-schema-for-humans`** (Python): generates Markdown from JSON Schema in various formats
- **`@adobe/jsonschema2md`** (npm): generates Markdown from JSON Schema, well-maintained
- **Custom script:** a wrapper around one of the above to enforce the specific README structure the platform requires

The custom script layer is likely necessary regardless of which tool is chosen.

### Secrets Management

> **TBD:** options for maintaining and exposing secrets for provisioning runs.
