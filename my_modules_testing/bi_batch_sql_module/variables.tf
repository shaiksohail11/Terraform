variable "network_interface_names" {
  type = list(string)
}

variable "resource_group_name" {
    type = string
  
}

variable "resource_group_location" {
  type = string
}

variable "nic_private_ip_addresses" {
  type = list(string)
}

variable "private_subnet_id" {
  type = string
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