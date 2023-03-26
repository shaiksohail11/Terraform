
resource "aws_instance" "main" {
  count                       = 2
  ami                         = "ami-017fecd1353bcc96e"
  instance_type               = "t2.micro"
  associate_public_ip_address = false
  tags = {

    Name = "${terraform.workspace}-instance"

  }

}

resource "aws_vpc" "my_vpc" {
  cidr_block = var.aws_vpc_cidr



  tags = {

    Name = "${terraform.workspace}-vpc"

  }
  depends_on = [
    aws_instance.main
  ]
}

resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.aws_subnet_cidr
  map_public_ip_on_launch = false



  tags = {

    Name = "${terraform.workspace}-subnet"
  }
  depends_on = [
    aws_instance.main,
    aws_vpc.my_vpc
  ]
}