resource "aws_instance" "web" {
    ami = data.aws_ami.ubuntu.id
    instance_type= "t2.micro"
    # Here I should findout the private address
    #private_ip = "10.10.0.0/16"


    tags = {
      "Name" = "Test"
    }
  
}

data "aws_ami" "ubuntu" {
    most_recent = true
  owners           = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-*-amd64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  
}

output "ami_id" {
    value = data.aws_ami.ubuntu.id
  }