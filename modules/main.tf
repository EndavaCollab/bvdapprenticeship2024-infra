resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "networking" {
  source              = "./modules/networking"
  vnet_name           = var.vnet_name
  subnet_name         = var.subnet_name
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  address_space       = var.address_space
  subnet_prefix       = var.subnet_prefix
}

module "security" {
  source              = "./modules/security"
  nsg_name            = var.nsg_name
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
}

module "rcb_vm" {
  source                  = "./modules/vm"
  resource_group_name     = azurerm_resource_group.main.name
  location                = var.location
  server_name             = var.rcb_vm_name
  admin_username          = var.admin_username
  admin_ssh_public_key    = var.admin_ssh_public_key
  disk_size               = var.disk_size
  network_interface_ids   = [module.networking.subnet_id]
}

module "exm_vm" {
  source                  = "./modules/vm"
  resource_group_name     = azurerm_resource_group.main.name
  location                = var.location
  server_name             = var.exm_vm_name
  admin_username          = var.admin_username
  admin_ssh_public_key    = var.admin_ssh_public_key
  disk_size               = var.disk_size
  network_interface_ids   = [module.networking.subnet_id]
}

module "sql" {
  source                  = "./modules/sql"
  resource_group_name     = azurerm_resource_group.main.name
  location                = var.location
  server_name             = var.sql_server_name
  admin_username          = var.admin_username
  admin_password          = var.admin_password
  rcb_database_name       = var.rcb_database_name
  exm_database_name       = var.exm_database_name
}
