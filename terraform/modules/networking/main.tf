resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

locals {
  subnets = flatten(var.virtual_machines[*].networking.subnets)
  public_ip = var.virtual_machines[*].networking.public_ip
}

resource "azurerm_subnet" "subnet" {
  count                = length(local.subnets)
  name                 = local.subnets[count.index].name
  resource_group_name  = var.resource_group_name

  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [local.subnets[count.index].prefix]
}

resource "azurerm_public_ip" "ip" {
  count               = length(var.virtual_machines)
  resource_group_name = var.resource_group_name
  location            = var.location
  
  name                = local.public_ip[count.index].name
  allocation_method   = local.public_ip.allocation_method

  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_network_interface" "network_interface" {
  count               = length(var.virtual_machines)
  resource_group_name = var.resource_group_name
  location            = var.location

  name                = var.virtual_machines[count.index].networking.network_interface.name

  dynamic "ip_configuration" {
    for_each = var.virtual_machines[count.index].networking.network_interface.ip_configurations

    content {
      private_ip_address_allocation = "Dynamic"
      name                          = ip_configuration.value.name
      subnet_id                     = lookup(ip_configuration.value, "subnet", null) == null ? null : [for subnet in azurerm_subnet.subnet : subnet.id if subnet.name == ip_configuration.value.subnet][0]
      public_ip_address_id          = lookup(ip_configuration.value, "public_ip", null) == null ? null : [for ip in azurerm_public_ip.ip : ip.id if ip.name == ip_configuration.value.public_ip][0]
    }
  }
}
