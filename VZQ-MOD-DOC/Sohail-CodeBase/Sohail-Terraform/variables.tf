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

variable "subnet_names" {
  type = list(string)
}

variable "subnet_address_prefixes" {
  type = list(string)
}

variable "create_public_ip" {
  type = bool
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
  type = list(bool)
}


variable "disk_names" {
  type = list(string)
}

variable "disk_sizes" {
  type = list(string)

}

# Windows module variables 

variable "win_network_interface_names" {
  type = list(string)
}

variable "win_nic_private_ip_addresses" {
  type = list(string)
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
