# General
resource_group_name = "apprenticeship-2024-rg"
disk_size           = 30
location            = "North Europe"
nsg_name            = "nsg"
vnet_name           = "vnet"
address_space       = ["10.0.0.0/16"]
subnets = [
  {
    name   = "exm-subnet-1"
    prefix = "10.0.1.0/24"
  },
  {
    name   = "rcb-subnet-1"
    prefix = "10.0.2.0/24"
  }
]

# Expense manager
backend_exm_port  = 8080
exm_database_name = "exm-db"
exm_vm_name       = "exm-vm"

# Recipe book
backend_rcb_port  = 8080
rcb_database_name = "rcb-db"
rcb_vm_name       = "rcb-vm"


# Secrets env
# admin_password -> TF_VAR_admin_password (used for db)
# admin_username -> TF_VAR_admin_username (used for both db and vms)
# admin_ssh_public_key -> TF_VAR_admin_ssh_public_key (used for vms)
