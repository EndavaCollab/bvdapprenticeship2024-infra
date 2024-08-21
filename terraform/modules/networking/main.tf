resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet" {
  for_each             = [for vm in var.virtual_machines : vm.networking.subnets]
  name                 = each.value.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value.prefix]
}

resource "azurerm_public_ip" "ip" {
  for_each            = [for vm in var.virtual_machines : vm.networking.public_ip]
  name                = each.value.name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = each.value.allocation_method

  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_network_interface" "network_interface" {

  for_each            = var.network_info.network_interface
  name                = each.name
  location            = var.location
  resource_group_name = var.resource_group_name
  


  # ip_configuration {
  #   name                          = "internal"
  #   subnet_id                     = azurerm_subnet.subnet[count.index].id
  #   private_ip_address_allocation = "Dynamic"
  #   public_ip_address_id          = azurerm_public_ip.ip[count.index].id
  # }

  dynamic "ip_configuration" {
    for_each = each.value.ip_configurations

    content {
      name                          = ip_configuration.value.name
      subnet_id                     = lookup(ip_configuration.value.subnet, azurerm_subnet.subnet[ip_configuration.value.subnet].id, null)
      private_ip_address_allocation = "Dynamic"
      # public_ip_address_id          = azurerm_public_ip.ip[ip_configuration.value.public_ip].id
      public_ip_address_id = lookup(ip_configuration.value.public_ip, azurerm_public_ip.ip[ip_configuration.value.public_ip].id, null)

    }
  }
}
