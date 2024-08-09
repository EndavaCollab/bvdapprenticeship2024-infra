output "rcp_jdbc_string" {
  value       = join("", ["jdbc:mysql://", azurerm_mysql_flexible_server.server.fqdn, ":3306/", azurerm_mysql_flexible_database.rcb_database.name])
  description = "JDBC string to initialize the DB connection (Recipe book)"
}

output "exm_jdbc_string" {
  value       = join("", ["jdbc:mysql://", azurerm_mysql_flexible_server.server.fqdn, ":3306/", azurerm_mysql_flexible_database.exm_database.name])
  description = "JDBC string to initialize the DB connection (Expense manager)"
}
