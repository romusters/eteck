# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_version = "~>1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.39.1"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {
}
# Create a resource group
resource "azurerm_resource_group" "rg20maildev" {
  name     = "rg20maildev"
  location = "West Europe"
}
