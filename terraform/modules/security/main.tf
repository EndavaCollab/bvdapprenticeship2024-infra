resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name


  dynamic "security_rule" {
    for_each = var.security_rules

    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      protocol                   = security_rule.value.protocol
      destination_port_range     = security_rule.value.port
      source_port_range          = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      access                     = "Allow"
    }
  }

  lifecycle {
    ignore_changes = [ tags ]
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg-subnet-association" {
  count                     = length(var.subnet_ids)
  subnet_id                 = var.subnet_ids[count.index]
  network_security_group_id = azurerm_network_security_group.nsg.id
}
