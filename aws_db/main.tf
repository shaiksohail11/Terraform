resource "aws_vpc" "my_vpc" {
    cidr_block = "192.168.0.0/16"

    tags = {
      "Name" = "db_vpc"
    }
}
  


resource "aws_subnet" "subnet" {
    count = 2
    cidr_block = var.subnet_cidr_block[count.index]
    vpc_id = aws_vpc.my_vpc.id

    tags = {
        Name = var.subnet_name_tags[count.index]
  
}

}

resource "aws_db_security_group" "default" {
    description = "created by using tf.db"
  name = "rds_sg"

  ingress {
    cidr = "192.162.0.0/24"
  }

  tags = {
    Name = "rds_security_group"
  }
}

resource "aws_db_subnet_group" "db_subnet" {

  subnet_ids = ["subnet_cidr_block[0]id" , "subnet_cidr_block[1]id"]

  tags = {
    Name = "My DB subnet group"
  }
}