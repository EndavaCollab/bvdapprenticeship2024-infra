output "rcb_vm_name" {
  value       = module.rcb_vm.name
  description = "Name of the created VM for Recipe Book"
}

output "exm_vm_name" {
  value       = module.exm_vm.name
  description = "Name of the created VM for Expense Manager"
}

output "rcb_vm_ip_address" {
  value       = module.rcb_vm.ip_address
  description = "Public IP address for the created VM for Recipe Book"
}

output "exm_vm_ip_address" {
  value       = module.exm_vm.ip_address
  description = "Public IP address for the created VM for Expense Manager"
}

output "rcp_jdbc_string" {
  value       = module.sql.rcp_jdbc_string
  description = "JDBC string to initialize the DB connection (Recipe book)"
}

output "exm_jdbc_string" {
  value       = module.sql.exm_jdbc_string
  description = "JDBC string to initialize the DB connection (Expense manager)"
}

output "subnet_ids" {
  value       = module.networking.subnet_ids
  description = "IDs of the created subnets"
}