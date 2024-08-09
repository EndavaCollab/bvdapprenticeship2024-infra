output "name" {
  value       = azurerm_linux_virtual_machine.server.name
  description = "Name of the created VM"
}

output "ip_address" {
  value       = azurerm_linux_virtual_machine.server.public_ip_address
  description = "Public IP address for the created VM"
}
