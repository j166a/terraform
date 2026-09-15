# Terraform

This directory contains the practical assignments completed during the Terraform and Infrastructure as Code module.

The projects focus on using Terraform to provision AWS infrastructure and automate EC2 configuration.

## Assignments

### 01-lab01 - WordPress Deployment

Deploys a WordPress application to Amazon EC2 using Terraform.

Key concepts demonstrated:

- AWS provider configuration
- EC2 provisioning
- security groups
- input variables
- outputs
- dynamic AMI lookup using a data source
- EC2 `user_data`
- automated installation of:
  - Apache
  - PHP
  - MariaDB
  - WordPress
- Terraform lifecycle management with `plan`, `apply`, and `destroy`

See:

```text
01-lab01/
```

for the full Terraform configuration, screenshots, and project documentation.

### 02-lab02 - EC2 Deployment with Cloud-Init

Deploys an EC2 instance and configures it automatically using a cloud-init YAML file passed through Terraform.

Key concepts demonstrated:

- Terraform `user_data`
- cloud-init YAML
- automated package installation
- automated service configuration
- boot-time EC2 configuration
- variables and outputs
- fully automated deployment with no manual server configuration

See:

```text
02-lab02/
```

for the Terraform configuration and assignment documentation.

## Directory Structure

```text
.
├── 01-lab01/
│   └── WordPress deployment
│
├── 02-lab02/
│   └── EC2 deployment with cloud-init
│
└── README.md
```

## Skills Demonstrated

Across both assignments:

- Infrastructure as Code
- declarative infrastructure management
- AWS resource provisioning
- Terraform providers
- resources
- data sources
- variables
- outputs
- Terraform state
- EC2 security groups
- EC2 bootstrapping
- `user_data`
- cloud-init
- automated infrastructure deployment
- infrastructure cleanup with `terraform destroy`

## Workflow

Typical Terraform workflow used throughout the assignments:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

Resources are removed when no longer required with:

```bash
terraform destroy
```