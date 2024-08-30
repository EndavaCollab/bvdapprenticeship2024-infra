# General info
resource_group_name = "apprenticeship-2024-rg"
location            = "North Europe"

# SQL
sql_server_name   = "sql-server-apprenticeship"
rcb_database_name = "rcb-db"
exm_database_name = "exm-db"

# Security
nsg_name = "nsg"
security_rules = [
  {
    name      = "AllowSSH",
    priority  = 1001,
    direction = "Inbound",
    protocol  = "Tcp"
    port      = "22"
  },
  {
    name      = "AllowHTTP",
    priority  = 1002,
    direction = "Inbound",
    protocol  = "Tcp"
    port      = "80"
  },
  {
    name      = "AllowHTTPS",
    priority  = 1003,
    direction = "Inbound",
    protocol  = "Tcp"
    port      = "443"
  },
  {
    name      = "AllowHTTPAlt",
    priority  = 1004,
    direction = "Inbound",
    protocol  = "Tcp"
    port      = "8080"
  }
]

# Networking
vnet_name     = "vnet"
address_space = ["10.0.0.0/16"]

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

virtual_machines = [
  {
    name      = "exm",
    disk_size = 30,
    vm_size   = "Standard_B1s"
  },
  {
    name      = "rcb",
    disk_size = 30,
    vm_size   = "Standard_B1s"
  }
]

# Secrets env
# admin_password -> TF_VAR_admin_password (used for db)
# admin_username -> TF_VAR_admin_username (used for both db and vms)
# admin_ssh_public_key -> TF_VAR_admin_ssh_public_key (used for vms)
