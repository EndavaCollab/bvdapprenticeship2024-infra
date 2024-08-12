terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.113.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "terraformstate-rg"
    storage_account_name = "apprenticeship2024st"
    container_name       = "tfstate"
    key                  = "state.tfstate"
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}
