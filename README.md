# Platform Constitution

## Introduction

This document defines the governing principles for the w5d.io platform. These principles apply to all repositories in the [w5d.io](https://github.com/w5dio) GitHub organisation.

## Principles

### 1. Declarative Configuration

The platform is defined through declarative configuration.

Declarative configuration:

- Describes the desired state
- Is the single source of truth
- Is version-controlled
- Uses the format best suited for the purpose

---

### 2. Single Source of Truth

Each declarative configuration is the single source of truth for the aspect it defines.

- Each aspect is defined in exactly one place
- Updating an aspect must require changes in only that place
- Declarative configuration must not be duplicated in documentation

---

### 3. Separation of Systems

The platform consists of independent systems that interpret declarative configuration.

Each system:

- Operates on relevant parts of the configuration
- Can be reasoned about independently

---

### 4. Application

Declarative configuration is applied to realise the desired state.

The application method:

- Is chosen based on the nature of the system
- May be automatic, semi-automatic, or manual

---

### 5. Validation

The actual state must be verifiable against the declared desired state.

Validation:

- Must be automated
- Must detect and report inconsistencies

```
                                    ┌────────────────┐                                 
                                    │                │                                 
                        ┌───────────┤ Validation     │──────────┐                                 
                        │           │                │          │ 
                        │           └────────────────┘          │             
                        │                                       │             
                        ▼                                       ▼             
┌────────┐      ┌────────────────┐      ┌────────┐      ┌────────────────┐
│        │      │ Declarative    │      │        │      │                │
│ Edit   ├─────►│ Configuration/ ├─────►│ Apply  ├─────►│ Actual State   │
│        │      │ Desired State  │      │        │      │                │
└────────┘      └────────────────┘      └────────┘      └────────────────┘
```
