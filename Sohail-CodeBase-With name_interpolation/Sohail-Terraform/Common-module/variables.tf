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

variable "client_name" {
  type = string
}

variable "environment_name" {
  type = string
}

