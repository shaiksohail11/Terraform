
resource "aws_vpc" "my_vpc" {
    cidr_block = var.vpc_cidr
  
  tags = {

    Name = "my_vpc"
  }
}

resource "aws_subnet" "subnet" {
    count = 2
    cidr_block = var.subnet_cidr[count.index]
    vpc_id = aws_vpc.my_vpc.id

tags = {
  "Name" = var.subnet_tags[count.index]
}
  
}

# Let us create a route table association

resource "aws_route_table_association" "my_route_association" {
    route_table_id = aws_route_table.my_route.id
    subnet_id = aws_subnet.subnet[0].id
  
}

# Let us create a security group here 

resource "aws_security_group" "my_security_group" {
    vpc_id = aws_vpc.my_vpc.id
    
      ingress {
    description      = "TLS from VPC"
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
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
    Name = "allow_tls"
  }
}
  
# let us create an route table

resource "aws_route_table"   "my_route" {
    vpc_id = aws_vpc.my_vpc.id


    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_igw.id
    }

tags = {
  Name = "my_route"
}
}

## Let me create a igw

resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.my_vpc.id

    tags = {
      "Name" = "my_igw"
    }
  
}
