resource "aws_vpc" "my_vpc" {
    cidr_block = var.vpc_cidr
    
  
    

    tags = {
      "Name" = "my_vpc"
    }
  
}

resource "aws_subnet" "subnet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.subnet_cidr

    tags = {
      "Name" = "provsub"
    }
  
}


resource "aws_security_group" "allow_all" {
    name = "web"
    description = "Alllow all traffic"
    vpc_id = aws_vpc.my_vpc.id

     ingress {
    description      = "allow ssh port"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }

     ingress {
    description      = "allow ssh port"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  
}