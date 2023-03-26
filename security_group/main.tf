
resource "aws_vpc" "my_vpc" {
    cidr_block = "192.168.0.0/16"

    tags = {
      Name = "New"
    }
  
}



resource "aws_security_group" "My_security_group" {
    name = "Allow-All-Ports"
    description = "created by using terraform"
    vpc_id = aws_vpc.my_vpc.id
  


 ingress {
    description      = "Allow all ports"
    from_port        = 0
    to_port          = 0
    protocol         = "all"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "all"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
    tags = {
    Name = "allow-all-ports"
  
  }
  depends_on = [
    aws_vpc.my_vpc
  ]

  }
