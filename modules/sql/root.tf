terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.113.0"
    }
  }
  required_version = ">= 1.1.0"
}

resource "azurerm_mysql_flexible_server" "database" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  administrator_login = var.admin_username
  # TODO: password as secret
  administrator_password = var.admin_password
}