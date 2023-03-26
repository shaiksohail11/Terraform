#Created 2 VPC with 4 Subnets each..In a lengthy way. 

resource "aws_vpc" "ntier" {
  cidr_block = "192.168.0.0/16"

  tags = {
    Name = "Ntier"
  }
}

resource "aws_subnet" "Subnets" {
  count      = 4
  vpc_id     = aws_vpc.ntier.id
  cidr_block = var.subnet_cidrs[count.index]

  tags = {
    Name = var.subnet_name_tags[count.index]
  }

}

resource "aws_vpc" "ntier1" {
  cidr_block = "10.10.0.0/16"

  tags = {
    Name = "Ntier1"
  }
}

resource "aws_subnet" "Subnets1" {
  count      = 4
  vpc_id     = aws_vpc.ntier1.id
  cidr_block = var.subnet1_cidrs[count.index]

  tags = {
    Name = var.subnet1_name_tags[count.index]
  }

}
