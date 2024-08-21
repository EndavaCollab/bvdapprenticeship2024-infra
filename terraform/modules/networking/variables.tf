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

variable "virtual_machines" {
  description = "List of virtual machines with their configurations"
  type = list(object({
    name          = string
    database_name = string
    disk_size     = number
    networking = object({
      network_interface = object({
        name = string
        ip_configurations = list(object({
          name      = string
          subnet    = optional(string)
          public_ip = optional(string)
        }))
        security_group = object({
          name = string
          security_rules = list(object({
            name      = string
            priority  = number
            direction = string
            protocol  = string
            port      = string
          }))
        })
      })
      subnets = list(object({
        name   = string
        prefix = string
      }))
      public_ip = object({
        name              = string
        allocation_method = string
      })
    })
  }))
}
