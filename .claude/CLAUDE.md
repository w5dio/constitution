# CLAUDE.md — Platypus Framework

## Overview

This repository is the **framework** for building the Platypus platform. It provides the framework files installed into service repositories and defines what a service is and how it operates. All actual platform functionality is implemented in the individual service repositories. The platform is the entirety of all live service repositories built on this framework.

## Repo structure

### Project files

```
install                               ← not yet created
README.md
DECISIONS.md
framework/
  AGENTS.md
  scripts/
    generate-readme                   ← not yet created
    validate-config                   ← not yet created
  .github/workflows/run.yml          ← not yet created
```

- **`install`:** script that installs framework files into a service repository
- **`README.md`:** documentation of the Platypus framework
- **`DECISIONS.md`:** permanent record of architectural decisions and technology choices
- **`framework/AGENTS.md`:** agent instructions for developing a Platypus service, installed into every service repository
- **`framework/scripts/generate-readme`:** generates the service README from the config schema
- **`framework/scripts/validate-config`:** validates the config against the config schema
- **`framework/.github/workflows/run.yml`:** GitHub Actions workflow for operating a Platypus service

### Internal docs

- `.claude/CLAUDE.md`: this file
- `.claude/CLAUDE-stale.md`: previous version of this file — to be deleted
- `.claude/design.md`: design doc — a temporary map of ideas used during development, not a spec
- `.claude/roadmap.md`: current roadmap
- `.claude/example.schema.json`, `.claude/example.yaml`: example schema and config used during research
- `.claude/research/research.md`: background research collected during development
- `.claude/research/jsonschema2markdown/`: outputs from the JSON Schema to Markdown tool evaluation

## Writing conventions

- When referring to service repository files in prose (including in AGENTS.md), use these short names rather than the exact filenames. Use the exact filename only when precision matters (e.g. in file listings, when first introducing the file, or in code contexts):
  - **config:** `config.yaml`
  - **config schema:** `config.schema.json`
  - **workflow file:** `.github/workflows/run.yml`
  - **Terraform files:** `*.tf`
  - **README:** `README.md`
- Always write "repository" in prose. Only abbreviate to "repo" when space is scarce (e.g. in tables or code comments)
- Always write "OpenID Connect" in full — never abbreviate to "OIDC"

## Working style

- Discuss and propose before writing to files — prefer presenting a draft or plan for the user to review first
- Work through items one by one, each in a separate turn, rather than doing everything at once
- Discuss back and forth with the user throughout — do not make decisions unilaterally

## Design doc (temporary)

The design doc (`.claude/design.md`) is a loose collection of ideas from earlier work. As long as it contains content:

- Always consult it as an additional input alongside discussions with the user
- When content from the design doc has been covered in a final file, delete it from the design doc
- When content is encountered that is now invalid or obsolete, delete it from the design doc

The expected outcome is that the design doc becomes empty and can be deleted.

## Current task

The current task is tracked in `.claude/roadmap.md`. Tasks are marked with `[ ]` (not started), `[/]` (in progress), or `[x]` (complete). Work on the first incomplete task unless the user specifies otherwise.
