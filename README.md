# Introduction
Application which sends an e-mail at regular intervals.
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
Docker: https://www.docker.com/

## Docker

Build and push Docker container so that it can be used in function app.

Build: `docker build -f docker/functions/Dockerfile -t mail:latest .`
Login: `az acr login --name myregistry`
Tag: `docker tag mail:latest myregistry.azurerc.io/eteck:latest `
Push: `docker push myregistry.azurerc.io/eteck:latest`.

Or run the Azure DevOps build pipeline.


## Terraform
`cd infra`

`terraform init`

`az login terraform`
`terraform init`
`terraform plan -var-file ../config/dev.tfvars.json`
`terraform apply -var-file ../config/dev.tfvars.json -auto-approve`

# How to do quality assurance
## Prerequisites
Install all from: https://github.com/antonbabenko/pre-commit-terraform
Such as: https://github.com/minamijoyo/tfupdate/releases

`pip install pre-commit pylint checkov`

`choco install terraform-docs tflint tfsec infracost` (as admin)

`pre-commit install`


If you like to use the latest version of the pre-commit hooks: `pre-commit autoupdate`.
