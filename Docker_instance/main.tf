# Let us create a ec2 instance


resource "aws_instance" "Docker" {  # Here I am installing docker by using provisioning
  ami = var.ami
  instance_type = "t2.large"
  key_name = "web1"
  associate_public_ip_address = true
  subnet_id = aws_subnet.dock_subnet.id
  vpc_security_group_ids = [ aws_security_group.dock_sg.id ]

  tags = {
    "Name" = "docker_instance"
  }
  
 
depends_on = [
  aws_vpc.dock_vpc,
  aws_subnet.dock_subnet,
  aws_security_group.dock_sg
]

}

resource "null_resource" "Docker_null" {

  triggers = {

    trigger_number = var.trigger_num
  }
  
provisioner "remote-exec" {
    

    

     connection {
       type = "ssh"
       user = "ubuntu"
       private_key = file("web1.pem")
       host = aws_instance.Docker.public_ip
    
     }

     inline = [
       
      "curl -fsSL https://get.docker.com -o get-docker.sh",
               "sh get-docker.sh",
        "sudo usermod -aG docker ubuntu"

    ]
      
    
}

depends_on = [
  aws_instance.Docker
]


}