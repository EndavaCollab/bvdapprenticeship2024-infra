variable "resource_group_name" {
  description = "Name of the Resource Group for the projects"
  type        = string
}

variable "location" {
  description = "Location of the resources for the projects"
  type        = string
}

variable "security_groups" {
  description = "Security groups for the network interfaces"
  type = list(object({
    name = string
    security_rules = list(object({
      name      = string
      priority  = number
      direction = string
      protocol  = string
      port      = string
    }))
  }))
}
