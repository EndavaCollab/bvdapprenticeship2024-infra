output "vm_name" {
  value       = azurerm_linux_virtual_machine.server.name
  description = "Name of the created VM"
}

output "vm_ip_address" {
  value       = azurerm_linux_virtual_machine.server.public_ip_address
  description = "Public IP address for the created VM"
}

output "vm_network_interface_id" {
  value       = azurerm_network_interface.vm_nic.id
  description = "ID of the network interface associated with the VM"
}
