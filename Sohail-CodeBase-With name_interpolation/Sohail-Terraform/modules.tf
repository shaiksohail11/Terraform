# Common-module

module "Common-module" {
  source = "./Common-module"

  resource_group_name             = var.resource_group_name
  resource_group_location         = var.resource_group_location

  environment_name = var.environment_name
  client_name = var.client_name

  virtual_network_name            = var.virtual_network_name
  virtual_network_address_space   = var.virtual_network_address_space

  subnet_names                    = var.subnet_names
  subnet_address_prefixes         = var.subnet_address_prefixes
  
  create_public_ip                = var.create_public_ip
  public_ip_name                  = var.public_ip_name

}

# Ubuntu-VM-Module.


module "Ubuntu-vm-module" {
  source = "./Ubuntu-vm-module"

  resource_group_name           = module.Common-module.resource_group_name
  resource_group_location       = module.Common-module.resource_group_location

  environment_name = var.environment_name
  client_name = var.client_name

  network_interface_names       = var.network_interface_names
  nic_private_ip_addresses      = var.nic_private_ip_addresses

  private_subnet_id             = module.Common-module.private_subnet_id
  
  public_subnet_id              = module.Common-module.public_subnet_id
  public_ip_address_id          = module.Common-module.public_ip_address_id
  nsg_names                     = var.nsg_names

  vm_names                      = var.vm_names
  vm_admin_username             = var.vm_admin_username
  vm_admin_password             = var.vm_admin_password
  vm_type                       = var.vm_type
  is_it_spot_vm                 = var.is_it_spot_vm

  disk_names                    = var.disk_names
  disk_sizes                    = var.disk_sizes

}

# Windows-VM-Module.

module "Windows-vm-module" {
  source = "./Windows-vm-module"

  resource_group_name           = module.Common-module.resource_group_name
  resource_group_location       = module.Common-module.resource_group_location

  environment_name = var.environment_name
  client_name = var.client_name

  win_network_interface_names   = var.win_network_interface_names
  win_nic_private_ip_addresses  = var.win_nic_private_ip_addresses

  private_subnet_id             = module.Common-module.private_subnet_id
  
  public_subnet_id              = module.Common-module.public_subnet_id
  public_ip_address_id          = module.Common-module.public_ip_address_id
  win_nsg_names                 = var.win_nsg_names

  win_vm_names                   = var.win_vm_names
  win_vm_admin_username          = var.win_vm_admin_username
  win_vm_admin_password          = var.win_vm_admin_password
  win_vm_type                    = var.win_vm_type
  is_win_spot_vm                 = var.is_win_spot_vm

  win_disk_names                 = var.win_disk_names
  win_disk_sizes                 = var.win_disk_sizes

}