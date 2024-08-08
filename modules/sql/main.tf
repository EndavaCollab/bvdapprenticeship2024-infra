resource "azurerm_mysql_flexible_server" "server" {
  name                = var.server_name
  resource_group_name = var.resource_group_name
  location            = var.location
  administrator_login = var.admin_username
  # TODO: password as secret
  administrator_password = var.admin_password
}

resource "azurerm_mysql_flexible_database" "database" {
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
  name                = var.database_name
}
