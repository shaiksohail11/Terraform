
resource "aws_internet_gateway" "dock_igw" {
    vpc_id = aws_vpc.dock_vpc.id
  
  depends_on = [
    aws_vpc.dock_vpc
  ]
}


resource "aws_route_table" "dock_route_table" {
    vpc_id = aws_vpc.dock_vpc.id


route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dock_igw.id
  }

  tags = {
    Name = "dock_route_table"
  }

  depends_on = [
    aws_vpc.dock_vpc
  ]
  
}

resource "aws_route_table_association" "dock_rt_ass" {
    subnet_id = aws_subnet.dock_subnet[0].id
    route_table_id = aws_route_table.dock_route_table.id

  depends_on = [
    aws_vpc.dock_vpc,
    aws_subnet.dock_subnet,
    aws_route_table.dock_route_table
  ]
}