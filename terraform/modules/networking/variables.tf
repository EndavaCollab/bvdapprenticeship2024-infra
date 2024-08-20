variable "vnet_name" {
  description = "Name of the Virtual Network for the projects"
  type        = string
}

variable "address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
}

variable "resource_group_name" {
  description = "Name of the Resource Group for the projects"
  type        = string
}

variable "location" {
  description = "Location of the resources for the projects"
  type        = string
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
