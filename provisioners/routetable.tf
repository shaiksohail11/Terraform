resource "aws_route_table" "igw_route" {
  vpc_id = aws_vpc.my_vpc.id
  

  route {
    gateway_id = aws_internet_gateway.igw.id
    cidr_block = "0.0.0.0/0"

  }

  tags = {
    "Name" = "igw-route"
  }

depends_on = [
  aws_vpc.my_vpc
]

}


  resource "aws_route_table_association" "www" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.igw_route.id
  }
