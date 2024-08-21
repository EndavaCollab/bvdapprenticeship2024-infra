resource "azurerm_network_security_group" "nsg" {
  count = len(var.security_groups)
  name                = var.security_groups[count.index].name
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "security_rule" {
    for_each = var.security_groups[count.index].security_rules

    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = "Allow"
      protocol                   = security_rule.value.protocol
      source_port_range          = "*"
      destination_port_range     = security_rule.value.port
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
  # security_rule {
  #   name                       = "AllowSSH"
  #   priority                   = 1001
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "Tcp"
  #   source_port_range          = "*"
  #   destination_port_range     = "22"
  #   source_address_prefix      = "*"
  #   destination_address_prefix = "*"
  # }

  # security_rule {
  #   name                       = "AllowHTTP"
  #   priority                   = 1002
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "Tcp"
  #   source_port_range          = "*"
  #   destination_port_range     = "80"
  #   source_address_prefix      = "*"
  #   destination_address_prefix = "*"
  # }

  # security_rule {
  #   name                       = "AllowHTTPAlt"
  #   priority                   = 1003
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "Tcp"
  #   source_port_range          = "*"
  #   destination_port_range     = "8080"
  #   source_address_prefix      = "*"
  #   destination_address_prefix = "*"
  # }
}
