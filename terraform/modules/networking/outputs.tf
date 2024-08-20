output "vnet_id" {
  description = "ID of the Virtual Network"
  value       = azurerm_virtual_network.vnet.id
}

output "network_interface_ids" {
  description = "IDs for the created network interfaces"
  value       = [for nic in azurerm_network_interface.network_interface : nic.id]
}
