variable "network" {
  type = object({
    vpc-cidr_block  = string
    subnet-nametags = list(string)
    region          = string
    ami             = string
    instance-type   = string
    trigger_num = string
  })

}