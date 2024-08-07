resource "azurerm_mysql_flexible_server" "database" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  administrator_login = var.admin_username
  # TODO: password as secret
  administrator_password = var.admin_password
}