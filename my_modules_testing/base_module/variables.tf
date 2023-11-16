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