# Create 6 subnets using count variables.

resource "aws_vpc" "my-vpc" {
    cidr_block = var.vpc_cidr
   
   tags = {
     "Name" = "n-tier-vpc"
   }
  
}

resource "aws_subnet" "my-subnets" {
      vpc_id = aws_vpc.my-vpc.id
      count = 6
      cidr_block = var.subnet_cidr[count.index]

      tags = {
        "Name" = var.subnets_names[count.index]
      }
  
}