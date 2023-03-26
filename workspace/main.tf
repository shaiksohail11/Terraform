resource "aws_vpc" "testvpc" {
  cidr_block = var.cidr_block

  tags   = {
    Name = "prod_vpc"

  }

}

resource "aws_subnet" "subnet" {

  vpc_id     = aws_vpc.testvpc.id
  cidr_block = var.subnet_cidr_block

  tags   = {
    Name = "subnet0"

  }

  depends_on = [
    aws_vpc.testvpc
  ]



}