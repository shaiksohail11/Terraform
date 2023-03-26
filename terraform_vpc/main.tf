resource "aws_vpc" "my_vpc" {
  cidr_block = "192.168.0.0/16"
}

resource "aws_subnet" "firstsubnet" {
vpc_id = aws_vpc.my_vpc.id # implicit dependecy {
  cidr_block = "192.168.1.0/24"
}

resource "aws_subnet" "secondsubnet"{
vpc_id = aws_vpc.my_vpc.id # implicit dependecy {
  cidr_block = "192.168.2.0/24"
}

resource "aws_subnet" "thirdsubnet" {
vpc_id = aws_vpc.my_vpc.id # implicit dependecy {
  cidr_block = "192.168.3.0/24"
}

resource "aws_subnet" "fourthsubnet" {
vpc_id = aws_vpc.my_vpc.id # implicit dependecy {
  cidr_block = "192.168.4.0/24"
}

resource "aws_subnet" "fifthsubnet" {
  vpc_id = aws_vpc.my_vpc.id #Implicit dependency
  cidr_block = "192.168.5.0/24"
  
}

resource "aws_subnet" "sixthsubnet" {
vpc_id = aws_vpc.my_vpc.id #implicit dependency
cidr_block = "192.168.6.0/24"
}