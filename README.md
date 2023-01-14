# Introduction

# How to run
## Local
python -m venv ~/virtualenvs/eteck

pip install -r requirements.txt

## On Windows
source ~/virtualenvs/eteck/Scripts/activate

## On Linux
activate ~/virtualenvs/eteck/bin/activate

## Cloud

## Prerequisites
Azure CLI: https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli
Terraform CLI: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

## Docker

Build and push Docker container so that it can be used in function app.

## Terraform
cd infra

terraform init

az login terraform
terraform init
terraform plan -var-file config def.tfvars.json
terraform apply


# How to do quality assurance
## Prerequisites
Install all from: https://github.com/antonbabenko/pre-commit-terraform
Such as: https://github.com/minamijoyo/tfupdate/releases
pip install pre-commit pylint checkov

choco install terraform-docs tflint tfsec infracost (as admin)

pre-commit install


If you like to use the latest version of the pre-commit hooks: `pre-commit autoupdate`.



Start mail 09:00
