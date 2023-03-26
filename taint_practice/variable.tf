variable "region" {
  type    = string #<optional> region where the string is created
  default = "us-west-2"
}

variable "cidr_block" {
  type    = string #<optional> cidr_block where the string is created
  default = "192.168.0.0/16"
}

variable "subnet_cidrs" {
  type    = list(string) #<optional> subnet where the string is created
}


variable "subnet_name_tags" {
  type    = list(string)
  default = ["web,app.db.dev"]
}
