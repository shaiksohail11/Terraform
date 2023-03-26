resource "aws_vpc" "ntier" {
  cidr_block = "192.168.0.0/16"
  
  tags = {
    Name = "Ntier"
  }
}

resource "aws_subnet" "Subnets" {
  count = 4
  vpc_id = aws_vpc.ntier.id
  cidr_block = var.subnet_cidrs[count.index]

  tags = {
Name = var.subnet_name_tags[count.index]
  }
  
}