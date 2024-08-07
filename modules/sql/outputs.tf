output "jdbc_string" {
  value       = "jdbc:mysql://" + azurerm_mysql_flexible_server.server.fqdn + ":3306/" + azurerm_mysql_flexible_database.database.name
  description = "JDBC string to initialize the DB connection"
}
