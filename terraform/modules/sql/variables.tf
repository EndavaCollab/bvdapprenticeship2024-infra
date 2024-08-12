variable "resource_group_name" {
  description = "The resource group in which the database will be created"
  type        = string
}

variable "server_name" {
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

variable "location" {
  description = "Location for the database (default: EU West)"
  type        = string
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
