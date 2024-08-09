output "vnet_id" {
  description = "ID of the Virtual Network"
  value       = azurerm_virtual_network.vnet.id
}

output "subnet_ids" {
  value       = { for s in azurerm_subnet.subnet : s.name => s.id }
  description = "IDs of the created subnets"
}
