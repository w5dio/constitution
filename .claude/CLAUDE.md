# CLAUDE.md — Platypus

## Overview

This repo is the **framework** for building the Platypus platform. It provides the framework files installed into service repos and defines what a service is and how it operates. All actual platform functionality is implemented in the individual service repos. The platform is the entirety of all live service repos built on this framework.

For more detail, see `.claude/design.md`.

## Internal docs

- `.claude/design.md`: design doc — a temporary map of ideas used during the development of the project, not a spec
- `.claude/roadmap.md`: current roadmap

## Project files

```
install                          ← not yet created
README.md                        ← not yet created
DECISIONS.md
framework/
  AGENTS.md
  .github/workflows/run.yml      ← not yet created
```

- **`install`:** script that installs framework files into a service repo by copying everything under `framework/` into it; safe to re-run
- **`README.md`:** description of this framework repo and how to use it
- **`DECISIONS.md`:** permanent record of architectural and technology decisions
- **`framework/AGENTS.md`:** agent instructions installed into every service repo
- **`framework/.github/workflows/run.yml`:** GitHub Actions workflow installed into every service repo
