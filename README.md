# tf-actions-aap-aws

Provision AWS infrastructure with Terraform, then patch/configure launched instances using Ansible Automation Platform (AAP) using Terraform Actions.

## Overview

This repository is used to:

- Provision AWS infrastructure (networking/compute and related resources) via Terraform
- Expose infrastructure details required for downstream automation ( Instance IPs/tags)
- Use Ansible Automation Platform job templates to apply OS/application patches on the created instances

## Tech Stack

- **Terraform** (Infrastructure as Code + Actions for Day-2 operations)
- **AWS** (target platform)
- **Ansible Automation Platform** (post-provisioning patch automation)

## Prerequisites

- Access to HCP Terraform 
- Access to AWS
- Access to Ansible Automation Platform (controller URL, org, inventory, credentials, job templates)
- Network connectivity from AAP execution environment to target instances (direct or via bastion/SSM, as designed)

## Repository Layout

```text
.
├── README.md
├── actions.tf
├── ansible
│   ├── ansible.cfg
│   └── ec2_patching.yml
├── backend.tf
├── main.tf
├── outputs.tf
├── terraform.tfvars.example
└── variables.tf
```


