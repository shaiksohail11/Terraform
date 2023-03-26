
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id


  tags = {
    "Name" = "igw"
  }

  depends_on = [
    aws_vpc.my_vpc
  ]
}