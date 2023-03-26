resource "aws_instance" "webserver" {

ami = "ami-026b57f3c383c2eec"

instance_type = "t2.micro"
  

tags = {

    name = "dev"
  }

}

  resource "aws_instance" "shaik" {

    ami = "ami-026b57f3c383c2eec"
    instance_type = "t1.micro"
  }


