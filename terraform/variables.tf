variable "resource_group_name" {
  description = "Name of the Resource Group for the projects"
  type        = string
}

variable "location" {
  description = "Location of the resources for the projects"
  type        = string
}

variable "vnet_name" {
  description = "Name of the Virtual Network for the projects"
  type        = string
}

variable "address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
}

variable "nsg_name" {
  description = "Name of the Network Security Group for the projects"
  type        = string
  sensitive   = true
}

variable "admin_username" {
  description = "Username for the admin user"
  type        = string
  sensitive   = true
}

variable "admin_ssh_public_key" {
  description = "Public key for the admin user"
  type        = string
  sensitive   = true
}

variable "sql_server_name" {
  description = "Name for the MySql server"
  type        = string
}

variable "rcb_database_name" {
  description = "Name for the MySql database to be created inside the server. (Recipe book)"
  type        = string
}

variable "exm_database_name" {
  description = "Name for the MySql database to be created inside the server (Expense manager)"
  type        = string
}

variable "admin_password" {
  description = "Password for the admin user (Database)"
  type        = string
  sensitive   = true
}

variable "subnets" {
  description = "Required subnets to deploy the VMs"
  type = list(object({
    name   = string,
    prefix = string
  }))
}

variable "virtual_machines" {
  description = "List of virtual machines"
  type = list(object({
    name      = string,
    disk_size = string,
    vm_size   = string
  }))
}

variable "security_rules" {
  description = "List of security rules to apply to the NSG"
  type = list(object({
    name      = string,
    priority  = number,
    direction = string,
    protocol  = string
    port      = string
  }))
}
