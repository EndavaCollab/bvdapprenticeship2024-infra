resource "azurerm_network_security_group" "nsg" {
  count               = length(var.security_groups)
  location            = var.location
  resource_group_name = var.resource_group_name

  name                = var.security_groups[count.index].name
  
  dynamic "security_rule" {
    for_each = var.security_groups[count.index].security_rules

    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      protocol                   = security_rule.value.protocol
      destination_port_range     = security_rule.value.port
      access                     = "Allow"
      source_port_range          = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}
