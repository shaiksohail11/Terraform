

variable "vpc_cidr" {
type = string

}

variable "subnet_cidr" {
    type = list(string)
  
}

variable "subnet_tags" {
    type = list(string)
  
}

variable "ami" {
    type = string
  
}