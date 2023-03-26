variable "region" {
  type    = string
  default = "us-west=2"

}

variable "vpc_cidr" {
  type = list(string)

}

variable "firstsubnet_cidrs" {
  type = list(string)

}

variable "firstsubnet_name_tags" {
  type = list(string)

}


variable "Secondsubnet_cidr" {
  type = list(string)

}

variable "Secondsubnet_name_tags" {
  type = list(string)

}