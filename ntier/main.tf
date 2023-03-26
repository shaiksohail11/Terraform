#creating a vpc with 4subnets.

resource "aws_vpc" "ntier" {
    cidr_block = var.cidr_block
    tags = {
      "Name" = "ntier_vpc"
    }
}

resource "aws_subnet" "main" {
  count = "3"
    vpc_id = aws_vpc.ntier.id
  cidr_block = var.subnet_cidrs[count.index]

  tags = {
    "Name" = var.subnet_name_tags[count.index]
  }
  depends_on = [
    aws_vpc.ntier
  ]
}
