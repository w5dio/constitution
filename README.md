# Platypus

## Introduction

Platypus is a framework for building simple self-service infrastructure provisioning platforms. A platform consists of a set of Platypus services, each allowing users to define and configure the infrastructure to provision.

Platypus uses Terraform with [HCP Terraform](https://developer.hashicorp.com/terraform/cloud-docs) for provisioning and GitHub Actions for execution — everything else is completely unopinionated. You can use Platypus to provision any type of resource into any infrastructure provider.

## How it works

To use Platypus, you first install the framework into a new GitHub repository. Then you use the framework to implement the actual Platypus service in this repository (this process is AI-assisted). Once the service is live, users interact with it by editing a YAML config and committing it back to the repository — everything else is handled by the framework.

## Best practices

In theory, you can use Platypus to build services to provision any type of infrastructure for any type of usage (think, anything that you can define with Terraform). In practice, however, there are some dos and don'ts to use Platypus in the most effective way:

- Build services for self-contained infrastructure components and systems that are loosely coupled to the possible user applications (e.g. connected by simple values like IP addresses or URLs)
  — For example, DNS records, URL shorteners, uptime checks, AWS CloudWatch alarms and dashboards, IAM users and access grants
- Don't build services for tightly coupled application components that are better defined in the user's own Infrastructure as Code (IaC) configuration
