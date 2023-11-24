#Base_module_values

resource_group_name             = "amp-voziq-ace-sohail_rg" #sohail needs to be removed
resource_group_location         = "westus3"

virtual_network_name            = "vnet"
virtual_network_address_space   = "10.116.0.0/16"

subnet_names                    = [ "private_subnet","public_subnet" ]
subnet_address_prefixes         = [ "10.116.2.0/24","10.116.1.0/24" ]

environment_name                = "ace"
client_name                     = "amp"


#If the condition is set to 'true' change the 'nic_private_ip_addresses' according to the public subnet.
create_public_ip                = true
public_ip_name                  = "public-ip"


# Ubuntu module values

network_interface_names         = ["app_nic","bi_nic", "batch_nic","sql_nic"]
nic_private_ip_addresses        = ["10.116.1.7","10.116.2.6", "10.116.2.7","10.116.2.8" ] #"10.116.1.7"

nsg_names                       = ["app_nsg","bi_nsg", "batch_nsg","sql_nsg"]

vm_names                        = ["app-vm","bi-vm", "batch-vm","sql-vm"]
vm_type                         = ["Standard_DS1_v2", "Standard_DS1_v2", "Standard_DS1_v2", "Standard_DS1_v2"]
is_it_spot_vm                   = ["false","false","false","false"]
vm_admin_username               = ["azureuser", "azureuser", "azureuser", "azureuser"]
vm_admin_password               = ["Azure123", "Azure123", "Azure123", "Azure123"]

disk_names                      = ["app_DataDisk_1","bi_DataDisk_1", "batch_DataDisk_1", "sql_DataDisk_1"]
disk_sizes                      = ["64", "64", "64", "64"]


# windows module values

win_network_interface_names     = ["ml_nic"]
win_nic_private_ip_addresses    = ["10.116.2.9" ] #"10.116.1.7"

win_nsg_names                   = ["ml_nsg"]

win_vm_names                    = ["ml-vm"]
win_vm_type                     = ["Standard_DS1_v2"]
is_win_spot_vm                  = ["false"]
win_vm_admin_username           = ["azureuser"]
win_vm_admin_password           = ["Azure123"]

win_disk_names                  = ["ml_DataDisk_1"]
win_disk_sizes                  = ["64"]