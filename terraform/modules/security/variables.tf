variable "nsg_name" {
  description = "Name of the Network Security Group for the projects"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group for the projects"
  type        = string
}

variable "location" {
  description = "Location of the resources for the projects"
  type        = string
}

variable "security_rules" {
  description = "List of security rules to apply to the NSG"
  type = list(object({
    name      = string,
    priority  = number,
    direction = string,
    protocol  = string
    port      = string
  }))
}

variable "subnet_ids" {
  description = "List of subnet IDs to associate with the NSG"
  type        = list(string)
}
