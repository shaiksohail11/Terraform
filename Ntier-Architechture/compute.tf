resource "aws_instance" "my-instance" {

  ami                         = var.network.ami
  key_name                    = "oregon-key"
  associate_public_ip_address = true
  instance_type               = var.network.instance-type
  vpc_security_group_ids      = [aws_security_group.allow_all_traffic.id]
  subnet_id                   = aws_subnet.mysubnet[0].id
  tags = {
    "Name" = "my-instance"
  }

}


resource "null_resource" "instance_null" {

  triggers = {

    trigger_number = var.network.trigger_num
  }
  provisioner "remote-exec" {

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("oregon-key.pem")
      host        = aws_instance.my-instance.public_ip

    }

    inline = [
      "sudo apt update",
      "sudo apt install nginx -y"
    ]


  }
  depends_on = [
    aws_instance.my-instance
  ]
}