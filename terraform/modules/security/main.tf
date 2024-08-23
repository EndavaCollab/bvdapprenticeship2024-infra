resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name


  dynamic "security_rule" {
    for_each = var.security_rules

    content {
      name                       = each.value.name
      priority                   = each.value.priority
      direction                  = each.value.direction
      protocol                   = each.value.protocol
      destination_port_range     = each.value.port
      source_port_range          = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }

}

resource "azurerm_subnet_network_security_group_association" "nsg-subnet-association" {
  for_each                  = var.subnet_ids
  subnet_id                 = each.value
  network_security_group_id = azurerm_network_security_group.nsg.id
}
