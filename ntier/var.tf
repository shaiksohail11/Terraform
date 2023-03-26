

variable "region" {
  type = string
   default = "us-west-2"
  }

  variable "instance_name_tags" {
type = list(string)
    
  }

  variable "cidr_block" {
    type = string
    default = "10.0.0.0/16"
  }

  variable "subnet_cidrs" {
    type = list(string)
    
  }

  variable "subnet_name_tags" {

  type = list(string)
    
  }

