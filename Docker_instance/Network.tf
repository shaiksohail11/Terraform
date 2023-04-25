
resource "aws_vpc" "dock_vpc" {
    cidr_block = var.vpc_cidr_block
  

  tags = {
    "Name" = "dock_vpc"
  }
}

resource "aws_subnet" "dock_subnet" {
  vpc_id = aws_vpc.dock_vpc.id
  cidr_block = var.subnet_cidr_block

  tags = {
    "Name" = "dock_subnet"
  }

  depends_on = [
    aws_vpc.dock_vpc
  ]
  
}

## NOW Lets create a securty group

resource "aws_security_group" "dock_sg" {
    vpc_id = aws_vpc.dock_vpc.id

 ingress {
    description      = "Allow all TCP"
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
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
    "Name" = "dock_sg"
  }

  depends_on = [
    aws_vpc.dock_vpc,
    aws_subnet.dock_subnet
  ]
}
