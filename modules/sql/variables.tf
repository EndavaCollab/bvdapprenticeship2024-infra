variable "resource_group_name" {
  description = "The resource group in which the database will be created"
  type = string
}

variable "name" {
    description = "Name for the database"
    type = string
}

variable "location" {
    description = "Location for the database (default: EU West)"
    type = string
    default = "West Europe"
}

variable "admin_username" {
    description = "Username for the admin user"
    type = string
}

variable "admin_password" {
    description = "Password for the admin user"
    type = string
    sensitive = true
}