variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "virtual_network_name" {
    type = string
  
}

variable "virtual_network_address_space" {
  type = string
}

variable "private_subnet_name" {
  type = string
}

variable "private_subnet_address_prefixes" {
  type = string
}

variable "public_subnet_name" {
  type = string
}

variable "public_subnet_address" {
  type = string
}

variable "public_ip_name" {
  type = string
}

variable "nic_private_ip_addresses" {
  type = list(string)
}


variable "network_interface_names" {
  type = list(string)
}

variable "nsg_names" {
  type = list(string)
}

variable "vm_names" {
  type = list(string)
}

variable "vm_admin_username" {
    type = list(string)
  
}

variable "vm_admin_password" {
  type = list(string)
}

variable "vm_type" {
  type = list(string)

}

variable "is_it_spot_vm" {
  type = bool
}

variable "vm_os_type" {
  type = string
}

variable "disk_names" {
  type = list(string)
}

variable "disk_sizes" {
    type = list(string)
  
}

# ML_module variables

variable "ml_network_interface_names" {
  type = list(string)
}

variable "ml_nic_private_ip_addresses" {
  type = list(string)
}

variable "ml_nsg_names" {
  type = list(string)
}

variable "ml_vm_names" {
  type = list(string)
}

variable "ml_vm_admin_username" {
  type = list(string)
}

variable "ml_vm_admin_password" {
  type = list(string)
}

variable "ml_vm_type" {
  type = list(string)
}

variable "is_ml_spot_vm" {
  type = bool
}

variable "ml_disk_names" {
  type = list(string)
}

variable "ml_disk_sizes" {
  type = list(string)
}

# App_module

variable "app_network_interface_names" {
  type = list(string)
}

variable "app_nic_private_ip" {
  type = list(string)
}

variable "app_nsg_names" {
  type = list(string)
}

variable "app_vm_names" {
  type = list(string)
}

variable "app_vm_admin_username" {
  type = list(string)
}

variable "app_vm_admin_password" {
  type = list(string)
}

variable "app_vm_type" {
  type = list(string)
}

variable "is_app_spot_vm" {
    type = bool
}

variable "app_vm_os_type" {
  type = string
}

variable "app_disk_names" {
  type = list(string)
}

variable "app_disk_sizes" {
  type = list(string)
}