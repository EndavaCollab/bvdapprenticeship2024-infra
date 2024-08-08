variable "resource_group_name" {
  description = "The resource group in which the database will be created"
  type        = string
}

variable "location" {
  description = "Location for the database (default: EU West)"
  type        = string
  default     = "West Europe"
}

variable "server_name" {
  description = "Virtual Machine Name"
  type        = string
}

variable "admin_username" {
  description = "Username for the admin user"
  type        = string
}

variable "admin_ssh_public_key" {
  description = "Public key for the admin user"
  type        = string
}

variable "disk_size" {
  description = "Disk size for the server (in GB)"
  type        = number
}

variable "network_interface_ids" {
  description = "List of network interface IDs"
  type        = list(string)
}