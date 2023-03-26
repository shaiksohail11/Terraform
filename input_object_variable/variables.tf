variable "vpc_config" {
    
    type = object({

        region = string
        vpc_cidr = string
        subnet_cidr = list(string)
        subnets_names = list(string)

    })
  
}