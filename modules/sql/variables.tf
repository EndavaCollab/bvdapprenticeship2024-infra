variable "resource_group_name" {
  description = "The resource group in which the database will be created"
  type        = string
}

variable "server_name" {
  description = "Name for the MySql server"
  type        = string
}

variable "database_name" {
  description = "Name for the MySql database to be created inside the server"
  type        = string
}

variable "location" {
  description = "Location for the database (default: EU West)"
  type        = string
  default     = "West Europe"
}

variable "admin_username" {
  description = "Username for the admin user"
  type        = string
}

variable "admin_password" {
  description = "Password for the admin user"
  type        = string
  sensitive   = true
}