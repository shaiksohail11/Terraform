resource "aws_instance" "web" {
    ami = var.ami
    key_name = "web1"
    instance_type = "t2.micro"
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.allow_all.id ]
    subnet_id = aws_subnet.subnet.id

    tags = {
      Name = "web_instance"
    }

   provisioner "remote-exec" {
    

    

     connection {
       type = "ssh"
       user = "ubuntu"
       private_key = file("web1.pem")
       host = aws_instance.web.public_ip
    
     }

     inline = [
       "sudo apt update",
       "sudo apt install nginx -y"
     ]
      
    



    }
      
    

  
}