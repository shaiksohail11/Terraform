variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "virtual_network_name" {
  type = list(string)

}

variable "virtual_network_address_space" {
  type = list(string)
}

variable "private_subnet_name" {
  type = list(string)
}

variable "private_subnet_address_prefixes" {
  type = list(string)
}

variable "public_subnet_name" {
  type = list(string)
}

variable "public_subnet_address" {
  type = list(string)
}

variable "public_ip_name" {
  type = list(string)
}

variable "create_resource" {
  type    = bool
  default = false
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


variable "disk_names" {
  type = list(string)
}

variable "disk_sizes" {
  type = list(string)

}

