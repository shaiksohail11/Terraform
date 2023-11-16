#Base_module_values

resource_group_name             = "sohail_rg"
resource_group_location         = "westus3"

virtual_network_name            = "sohail_vnet"
virtual_network_address_space   = "10.116.0.0/16"

private_subnet_name             = "sohail_private_subnet"
private_subnet_address_prefixes = "10.116.2.0/24"

public_subnet_name = "public"
public_subnet_address = "10.116.1.0/24"
public_ip_name = "public-ip"

# Network_interface_values

network_interface_names = [ "bi_nic","batch_nic","sql_nic" ]
nic_private_ip_addresses = [ "10.116.2.6","10.116.2.7","10.116.2.5", ]

nsg_names = [ "bi_nsg","batch_nsg","sql_nsg" ]

vm_names = [ "bi-vm","batch-vm","sql-vm" ]
vm_type = [ "Standard_DS1_v2","Standard_DS1_v2","Standard_DS1_v2" ]
is_it_spot_vm = false
vm_admin_username = [ "azureuser","azureuser","azureuser" ]
vm_admin_password = [ "Azure123","Azure123","Azure123" ]
vm_os_type = "ubuntu"

disk_names = [ "bi_disk","batch_disk","sql_disk" ]
disk_sizes = [ "64","64","64" ]

# ml_module values

ml_network_interface_names = [ "ml_nic" ]
ml_nic_private_ip_addresses = [ "10.116.2.4" ]

ml_nsg_names = [ "ml_nsg" ]
ml_vm_names = [ "ml-vm" ]
ml_vm_type = [ "Standard_DS1_v2" ]
is_ml_spot_vm = false
ml_vm_admin_username = [ "azureuser" ]
ml_vm_admin_password = [ "Azure123" ]

ml_disk_names = [ "ml_disk" ]
ml_disk_sizes = [ "64" ]

# app_modules

app_network_interface_names = [ "app_nic" ]
app_nic_private_ip = [ "10.116.1.4" ]

app_nsg_names = [ "app_nsg" ]
app_vm_names = [ "app-vm" ]
app_vm_type = [ "Standard_DS1_v2" ]
is_app_spot_vm = false
app_vm_admin_username = [ "azureuser" ]
app_vm_admin_password = [ "Azure123" ]
app_vm_os_type = "ubuntu"

app_disk_names = [ "app_disk" ]
app_disk_sizes = [ "64" ]