resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

  locals {
    subnets = flatten(var.virtual_machines[*].networking.subnets)
  }

resource "azurerm_subnet" "subnet" {
count = length(local.subnets)
  name                 = local.subnets[count.index].name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [local.subnets[count.index].prefix]
}

resource "azurerm_public_ip" "ip" {
  count = length(var.virtual_machines)
  name                = var.virtual_machines[0].networking.public_ip.name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.virtual_machines[0].networking.public_ip.allocation_method

  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_network_interface" "network_interface" {
  count = length(var.virtual_machines)
  name                = var.virtual_machines[0].networking.network_interface.name
  location            = var.location
  resource_group_name = var.resource_group_name
  


  # ip_configuration {
  #   name                          = "internal"
  #   subnet_id                     = azurerm_subnet.subnet[count.index].id
  #   private_ip_address_allocation = "Dynamic"
  #   public_ip_address_id          = azurerm_public_ip.ip[count.index].id
  # }

  dynamic "ip_configuration" {
    for_each = var.virtual_machines[0].networking.network_interface.ip_configurations

    content {
      name                          = ip_configuration.value.name
      subnet_id                     = lookup(ip_configuration.value.subnet, azurerm_subnet.subnet[ip_configuration.value.subnet].id, null)
      private_ip_address_allocation = "Dynamic"
      # public_ip_address_id          = azurerm_public_ip.ip[ip_configuration.value.public_ip].id
      public_ip_address_id = lookup(ip_configuration.value.public_ip, azurerm_public_ip.ip[ip_configuration.value.public_ip].id, null)

    }
  }
}
