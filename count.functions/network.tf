
#Let us create a VPC

resource "aws_vpc" "ntier_vpc" {
    cidr_block = var.vpc_cidr

tags = {

    Name = "Ntier vpc"
}

}

resource "aws_subnet" "subnets" {

count = 3
vpc_id = aws_vpc.ntier_vpc.id
cidr_block = var.subnets_cidr[count.index]

tags = {
   
   Name = var.subnet_name[count.index]
}

  
}
  
