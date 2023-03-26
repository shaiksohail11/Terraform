#Created 2 VPC with 4 Subnets each..In a lengthy way. 

resource "aws_vpc" "ntier" {
  count      = 2
  cidr_block = var.vpc_cidr[count.index]

  tags = {
    Name = "Ntier"
  }
}

resource "aws_subnet" "firstsubnet" {
  count      = 4
  vpc_id     = aws_vpc.ntier[0].id
  cidr_block = var.firstsubnet_cidrs[count.index]

  tags = {
    Name = var.firstsubnet_name_tags[count.index]
  }

}


resource "aws_subnet" "Secondsubnet" {
  count      = 4
  vpc_id     = aws_vpc.ntier[1].id
  cidr_block = var.Secondsubnet_cidr[count.index]

  tags = {
    Name = var.Secondsubnet_name_tags[count.index]
  }

}
