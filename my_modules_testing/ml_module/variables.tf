variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "ml_network_interface_names" {
  type = list(string)
}

variable "ml_nic_private_ip_addresses" {
  type = list(string)
}

variable "private_subnet_id" {
  type = string
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