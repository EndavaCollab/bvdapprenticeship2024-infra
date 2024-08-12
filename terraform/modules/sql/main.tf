resource "azurerm_mysql_flexible_server" "server" {
  name                = var.server_name
  resource_group_name = var.resource_group_name
  location            = var.location
  administrator_login = var.admin_username
  # TODO: password as secret
  administrator_password = var.admin_password
}

resource "azurerm_mysql_flexible_database" "rcb_database" {
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
  name                = var.rcb_database_name
}

resource "azurerm_mysql_flexible_database" "exm_database" {
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
  name                = var.exm_database_name
}
