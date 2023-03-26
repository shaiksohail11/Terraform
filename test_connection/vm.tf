
resource "aws_instance" "public_vm" {
    ami = var.ami
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet[0].id
  associate_public_ip_address = true
  key_name = "web1"
  vpc_security_group_ids = [ aws_security_group.my_security_group.id ]

  tags = {
    "Name" = "public_vm"
  }
  
}



resource "aws_instance" "private_vm" {
    ami = var.ami
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet[1].id
   key_name =  "web1"
  vpc_security_group_ids = [ aws_security_group.my_security_group.id ]

  tags = {
    "Name" = "private_vm"
  }
  
}