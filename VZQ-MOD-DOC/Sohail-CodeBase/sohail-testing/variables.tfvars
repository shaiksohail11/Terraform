#  Ubuntu-vm-module values

resource_group_name             = "sohail_rg"
resource_group_location         = "westus3"
 
virtual_network_name            = ["sohail_vnet"]
virtual_network_address_space   = ["10.116.0.0/16"]

private_subnet_name             = ["sohail_private_subnet"]
private_subnet_address_prefixes = ["10.116.2.0/24"]

create_resource                 = false
 #If you are changing this value to "true" then change "NIC ip-config" in ubuntu-vm-module.
public_subnet_name              = ["public"]
public_subnet_address           = ["10.116.1.0/24"]
public_ip_name                  = ["public-ip"]

# Network_interface_values

network_interface_names         = ["bi_nic", "batch_nic"]
nic_private_ip_addresses        = ["10.116.2.6", "10.116.2.7"] #"10.116.1.7"

nsg_names                       = ["bi_nsg", "batch_nsg"]

vm_names                        = ["bi-vm", "batch-vm"]
vm_type                         = ["Standard_DS1_v2", "Standard_DS1_v2"]
is_it_spot_vm                   = false
vm_admin_username               = ["azureuser", "azureuser"]
vm_admin_password               = ["Azure123", "Azure123"]

disk_names                      = ["bi_disk", "batch_disk"]
disk_sizes                      = ["64", "64"]
