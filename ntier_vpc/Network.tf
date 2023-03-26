# Let us create a Vpc now.data

resource "aws_vpc" "ntier_vpc" {
cidr_block = var.cidr_block
tags       = {
  "name"   = "ntier"
}
}

resource "aws_subnet" "subnet" {
    count     = 4
    cidr_block = var.subnet_cidrs[count.index]
    vpc_id    = aws_vpc.ntier_vpc.id
    tags      = {
      "Name"  = var.subnet_name_tags[count.index]
    }  
    
}