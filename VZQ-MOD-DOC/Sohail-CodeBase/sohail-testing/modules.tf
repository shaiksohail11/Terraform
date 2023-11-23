# ubuntu vm module.

module "Ubuntu-vm-module" {
  source = "./Ubuntu-vm-module"

  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location

  virtual_network_name          = var.virtual_network_name
  virtual_network_address_space = var.virtual_network_address_space

  private_subnet_name             = var.private_subnet_name
  private_subnet_address_prefixes = var.private_subnet_address_prefixes

  create_resource       = var.create_resource
  public_subnet_name    = var.public_subnet_name
  public_subnet_address = var.public_subnet_address

  public_ip_name = var.public_ip_name

  network_interface_names  = var.network_interface_names
  nic_private_ip_addresses = var.nic_private_ip_addresses

  nsg_names = var.nsg_names

  vm_names          = var.vm_names
  vm_admin_username = var.vm_admin_username
  vm_admin_password = var.vm_admin_password
  vm_type           = var.vm_type
  is_it_spot_vm     = var.is_it_spot_vm

  disk_names = var.disk_names
  disk_sizes = var.disk_sizes
}
