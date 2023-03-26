variable "region" {
    type = string
    default = "us-west=2"
  
}

variable "subnet_cidrs" {
    type = list(string)
  
}

variable "subnet_name_tags" {
    type = list(string)
  
}