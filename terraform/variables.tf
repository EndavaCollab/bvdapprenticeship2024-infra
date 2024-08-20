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

variable "disk_size" {
  description = "Disk size for the server (in GBs)"
  type        = number
}

variable "rcb_vm_name" {
  description = "Virtual Machine Name for Recipe Book project"
  type        = string
}

variable "exm_vm_name" {
  description = "Virtual Machine Name for Expense Manager project"
  type        = string
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

variable "backend_exm_port" {
  description = "Port for Expense Manager backend application"
  type        = number
}

variable "backend_rcb_port" {
  description = "Port for Recipe Book backend application"
  type        = number
}

variable "networks" {
  description = "List of networks required to deploy the VMs"
  type = list(object({
    network_interface_name = string,
    subnet_name            = string,
    subnet_prefix          = string,
    public_ip_address_name = string
  }))
}
