variable "resource_group_name" {
  description = "The resource group in which the VM will be created"
  type        = string
}

variable "location" {
  description = "Location for the VM (default: EU West)"
  type        = string
}

variable "server_name" {
  description = "Name of the Virtual Machine"
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
  description = "Disk size for the VM (in GB)"
  type        = number
}

variable "subnet_id" {
  description = "The ID of the subnet to associate with the VM"
  type        = number
}
