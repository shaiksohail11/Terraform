resource "aws_instance" "ntier" {
    count = "4"
    ami = "ami-0d593311db5abb72b"

   instance_type = "t2.micro"

   tags = {

    Name = var.instance_name_tags[count.index]

   }
}

