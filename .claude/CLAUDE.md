# CLAUDE.md — Platypus

## Overview

This repo is the **framework** for building the Platypus platform. It provides the framework files installed into service repos and defines what a service is and how it operates. All actual platform functionality is implemented in the individual service repos. The platform is the entirety of all live service repos built on this framework.

For more detail, see `.claude/design.md`.

## Current task

We follow a roadmap in `.claude/roadmap.md` to work on this repository.

The current task is creating the `framework/AGENTS.md` file.

### Goal of AGENTS.md

AGENTS.md is installed into every service repo. Its purpose is to allow a coding agent that spins up in a fresh service repo (containing only the framework files) to fulfil its role without any additional context. The agent's role is to build a complete service together with the developer. The developer brings domain knowledge — what infrastructure to provision, what the config should look like — and the agent brings framework knowledge: what files to create, how to structure them, what constraints apply, and how everything fits together. They work interactively. For example, a developer might say: "I want a URL Shortener service that provisions URL redirects from a config with `short` and `long` fields." The agent should know exactly how to implement this within the framework — creating `config.yaml`, `config.schema.json`, and Terraform files that satisfy all framework constraints — and guide the developer through it.

AGENTS.md must give the agent everything it needs to know: the framework's structure, constraints, and conventions. It is not a tutorial — it is a complete reference for the agent's specific task.

### Writing process

Discuss back and forth with the user. You work through AGENTS.md section by section, using the section stubs as the guide. For each section, consult the design doc (`.claude/design.md`) for prior thoughts on the topic — but the design doc is a loose collection of ideas, not a spec. Treat its content as one input: adopt, discard, or refine ideas as needed, fill in gaps, and make decisions together with the user as you go. The content written into AGENTS.md is the single source of truth. Once a section in AGENTS.md is complete, delete the covered parts from the design doc (whether adopted or discarded). The design doc shrinks as AGENTS.md grows; when it is empty it can be deleted.

Sections not yet written are left as blockquote placeholders (lines starting with `>`). Do not fill in a placeholder until you are actively writing that section.

## Writing conventions

- When referring to service repository files in prose (including in AGENTS.md), use these short names rather than the exact filenames. Use the exact filename only when precision matters (e.g. in file listings, when first introducing the file, or in code contexts):
  - **config:** `config.yaml`
  - **config schema:** `config.schema.json`
  - **workflow file:** `.github/workflows/run.yml`
  - **Terraform files:** `*.tf`
  - **README:** `README.md`
- Always write "repository" in prose. Only abbreviate to "repo" when space is scarce (e.g. in tables or code comments).


## Repo structure

## Internal docs

- `.claude/CLAUDE.md`: this file
- `.claude/design.md`: design doc — a temporary map of ideas used during the development of the project, not a spec
- `.claude/research.md`: background research collected during development — internal for now, may be promoted later
- `.claude/roadmap.md`: current roadmap

## Project files

```
install                          ← not yet created
README.md
DECISIONS.md
framework/
  AGENTS.md
  .github/workflows/run.yml      ← not yet created
```

- **`install`:** script that installs framework files into a service repo by copying everything under `framework/` into it; safe to re-run
- **`README.md`:** documentation of the Platypus framework
- **`DECISIONS.md`:** permanent record of architectural decisions and technology choices for the Platypus platform
- **`framework/AGENTS.md`:** agent instructions for developing a Platypus service, installed into every service repo
- **`framework/.github/workflows/run.yml`:** GitHub Actions workflow for operating a Platypus service, installed into every service repo
