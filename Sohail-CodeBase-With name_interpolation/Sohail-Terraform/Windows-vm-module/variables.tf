variable "win_network_interface_names" {
  type = list(string)
}

variable "resource_group_name" {
  type = string

}

variable "resource_group_location" {
  type = string
}

variable "win_nic_private_ip_addresses" {
  type = list(string)
}

variable "private_subnet_id" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "public_ip_address_id" {
  type = string
}

variable "win_nsg_names" {
  type = list(string)
}

variable "win_vm_names" {
  type = list(string)
}

variable "win_vm_admin_username" {
  type = list(string)

}

variable "win_vm_admin_password" {
  type = list(string)
}

variable "win_vm_type" {
  type = list(string)

}

variable "is_win_spot_vm" {
  type = list(bool)
}


variable "win_disk_names" {
  type = list(string)
}

variable "win_disk_sizes" {
  type = list(string)

}

variable "client_name" {
  type = string
}

variable "environment_name" {
  type = string
}