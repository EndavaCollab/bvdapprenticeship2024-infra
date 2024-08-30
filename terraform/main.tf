data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

module "networking" {
  source              = "./modules/networking"
  vnet_name           = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space
  subnets             = var.subnets
}

module "security" {
  source              = "./modules/security"
  nsg_name            = var.nsg_name
  resource_group_name = var.resource_group_name
  location            = var.location
  security_rules      = var.security_rules
  subnet_ids          = module.networking.subnet_ids
}

module "vm" {
  count                       = length(var.virtual_machines)
  vm_name                     = var.virtual_machines[count.index].name
  source                      = "./modules/vm"
  resource_group_name         = var.resource_group_name
  location                    = var.location
  disk_size                   = 30
  vm_size                     = var.virtual_machines[count.index].vm_size
  admin_ssh_public_key        = var.admin_ssh_public_key
  admin_username              = var.admin_username
  public_ip_allocation_method = "Dynamic"
  subnet_id                   = module.networking.subnet_ids[count.index]
}

module "sql" {
  source              = "./modules/sql"
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = var.sql_server_name
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  rcb_database_name   = var.rcb_database_name
  exm_database_name   = var.exm_database_name
}
