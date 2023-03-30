# Creating vpc

resource "aws_vpc" "myvpc" {
  cidr_block           = var.network.vpc-cidr_block
  enable_dns_hostnames = true
  tags = {
    "Name" = "N-Tier"
  }
}

# Creating subnets
resource "aws_subnet" "mysubnet" {
  count      = length(var.network.subnet-nametags)
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = cidrsubnet(var.network.vpc-cidr_block, 8, count.index)

  tags = {
    "Name" = var.network.subnet-nametags[count.index]
  }
  depends_on = [
    aws_vpc.myvpc
  ]
}

# Creating a security group

resource "aws_security_group" "allow_all_traffic" {
  name        = "OPEN ALL PORTS"
  description = "OPEN ALL PORTS"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    description      = "OPEN ALL PORTS"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_all_traffic"
  }
}

# Creating internet-gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "my-gw"
  }
}

# Creating route table

resource "aws_route_table" "route" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "my-route"
  }
}

# Attaching subnet to route table

resource "aws_route_table_association" "association" {
  subnet_id      = aws_subnet.mysubnet[0].id
  route_table_id = aws_route_table.route.id

}