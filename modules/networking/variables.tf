variable "vnet_name" {
  description = "Name of the Virtual Network for the projects"
  type        = string
}

variable "subnet_name" {
  description = "Name of the Subnet for the projects"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group for the projects"
  type        = string
}

variable "location" {
  description = "Location of the resources for the projects"
  type        = string
  default     = "West Europe"
}

variable "address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_prefix" {
  description = "Address prefix for the Subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}
