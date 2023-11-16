variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "app_network_interface_names" {
  type = list(string)
}

variable "app_nic_private_ip" {
  type = list(string)
}

variable "public_subnet_id" {
  type = string
}

variable "public_ip_address_id" {
  type = string
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
