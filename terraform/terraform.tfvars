# General
resource_group_name = "apprenticeship-2024-rg"
location            = "North Europe"
sql_server_name     = "sql-server-apprenticeship"
vnet_name           = "vnet"
address_space       = ["10.0.0.0/16"]

virtual_machines = [
  {
    name          = "exm-vm",
    database_name = "exm-db",
    disk_size     = 30,
    networking = {
      network_interface = {
        name = "exm-nic"
        ip_configurations = [
          {
            name   = "exm-internal-1",
            subnet = "exm-subnet-1"
          },
          {
            name      = "exm-public",
            public_ip = "exm-public-ip"
          }
        ],
        security_group = {
          name = "exm-nsg",
          security_rules = [
            {
              name      = "AllowSSH"
              priority  = 1001
              direction = "Inbound"
              protocol  = "Tcp"
              port      = "22"
            },
            {
              name      = "AllowHTTP"
              priority  = 1002
              direction = "Inbound"
              protocol  = "Tcp"
              port      = "80"
            },
            {
              name      = "AllowHTTPAlt"
              priority  = 1003
              direction = "Inbound"
              protocol  = "Tcp"
              port      = "8080"
          }]
        }
      }
      subnets = [
        {
          name   = "exm-subnet-1",
          prefix = "10.0.1.0/24"
        }
      ]
      public_ip = {
        name              = "exm-public-ip"
        allocation_method = "Dynamic"
      }
    }
  },
  {
    name          = "rcb-vm",
    database_name = "rcb-db",
    disk_size     = 30,
    networking = {
      network_interface = {
        name = "rcb-nic"
        ip_configurations = [
          {
            name   = "rcb-internal-1",
            subnet = "rcb-subnet-1"
          },
          {
            name      = "rcb-public",
            public_ip = "rcb-public-ip"
          }
        ],
        security_group = {
          name = "rcb-nsg",
          security_rules = [
            {
              name      = "AllowSSH"
              priority  = 1001
              direction = "Inbound"
              protocol  = "Tcp"
              port      = "22"
            },
            {
              name      = "AllowHTTP"
              priority  = 1002
              direction = "Inbound"
              protocol  = "Tcp"
              port      = "80"
            },
            {
              name      = "AllowHTTPAlt"
              priority  = 1003
              direction = "Inbound"
              protocol  = "Tcp"
              port      = "8080"
          }]
        }
      }
      subnets = [
        {
          name   = "rcb-subnet-1",
          prefix = "10.0.1.0/24"
        }
      ]
      public_ip = {
        name              = "rcb-public-ip"
        allocation_method = "Dynamic"
      }
    }
  }
]

# Expense manager
exm_database_name = "exm-db"

# Recipe book
rcb_database_name = "rcb-db"

# Secrets env
# admin_password -> TF_VAR_admin_password (used for db)
# admin_username -> TF_VAR_admin_username (used for both db and vms)
# admin_ssh_public_key -> TF_VAR_admin_ssh_public_key (used for vms)
