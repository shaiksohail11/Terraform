# Now let us define some variables

variable "region" {
    type = string
    default = "us-west-2"
  
}

variable "vpc_cidr" {
    type = string
  
}

variable "subnets_cidr" {
    type = list(string)

  
}

variable "subnet_name" {
  type = list(string)
  
}