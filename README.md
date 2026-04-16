# Platypus Framework

This repository contains the framework of the Platypus platform — the set of files installed into every Platypus service repository that drive the development, deployment, and operation of the services.

---

## Appendix

### Service Repository File Roles

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
