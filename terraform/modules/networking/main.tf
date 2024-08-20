resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet" {
  count                = length(var.networks)
  name                 = var.networks[count.index].subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.networks[count.index].subnet_prefix]
}

resource "azurerm_public_ip" "ip" {
  count               = length(var.networks)
  name                = var.networks[count.index].public_ip_address_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_network_interface" "network_interface" {
  count               = length(var.networks)
  name                = var.networks[count.index].network_interface_name
  location            = var.location
  resource_group_name = var.resource_group_name
  lifecycle {
    create_before_destroy = true
  }
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet[count.index].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.ip[count.index].id
  }
}
