module "base_module" {
  source = "./base_module"

resource_group_name = var.resource_group_name
resource_group_location = var.resource_group_location

virtual_network_name = var.virtual_network_name
virtual_network_address_space = var.virtual_network_address_space

private_subnet_name = var.private_subnet_name
private_subnet_address_prefixes = var.private_subnet_address_prefixes

public_subnet_name = var.public_subnet_name
public_subnet_address = var.public_subnet_address
public_ip_name = var.public_ip_name


}

module "bi_batch_sql_module" {
  source = "./bi_batch_sql_module"

   resource_group_name = module.base_module.resource_group_name
   resource_group_location = module.base_module.resource_group_location
   
  network_interface_names = var.network_interface_names
  nic_private_ip_addresses = var.nic_private_ip_addresses

  private_subnet_id = module.base_module.private_subnet_id

  nsg_names = var.nsg_names

  vm_names = var.vm_names
  vm_admin_username = var.vm_admin_username
  vm_admin_password = var.vm_admin_password
  vm_type = var.vm_type
  is_it_spot_vm = var.is_it_spot_vm
  vm_os_type = var.vm_os_type

  disk_names = var.disk_names
  disk_sizes = var.disk_sizes
}

module "ml_module" {
  source = "./ml_module"

   resource_group_name = module.base_module.resource_group_name
   resource_group_location = module.base_module.resource_group_location

   ml_network_interface_names = var.ml_network_interface_names
   ml_nic_private_ip_addresses = var.ml_nic_private_ip_addresses

   private_subnet_id = module.base_module.private_subnet_id

   ml_nsg_names = var.ml_nsg_names
  
  ml_vm_names = var.ml_vm_names
  ml_vm_admin_username = var.ml_vm_admin_username
  ml_vm_admin_password = var.ml_vm_admin_password
  ml_vm_type = var.ml_vm_type
  is_ml_spot_vm = var.is_ml_spot_vm

  ml_disk_names = var.ml_disk_names
  ml_disk_sizes = var.ml_disk_sizes

}

module "app_module" {
  source = "./app_module"

  resource_group_name = module.base_module.resource_group_name
  resource_group_location = module.base_module.resource_group_location

  app_network_interface_names = var.app_network_interface_names
  app_nic_private_ip = var.app_nic_private_ip

  public_subnet_id = module.base_module.public_subnet_id
  public_ip_address_id = module.base_module.public_ip_id

  app_nsg_names = var.app_nsg_names

  app_vm_names = var.app_vm_names
  app_vm_admin_username = var.app_vm_names
  app_vm_admin_password = var.app_vm_admin_password
  app_vm_type = var.app_vm_type
  is_app_spot_vm = var.is_app_spot_vm
  app_vm_os_type = var.app_vm_os_type

  app_disk_names = var.app_disk_names
  app_disk_sizes = var.app_disk_sizes
}