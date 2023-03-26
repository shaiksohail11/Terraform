
#Let us create a VPC

resource "aws_vpc" "ntier_vpc" {
    cidr_block = var.vpc_cidr

tags = {

    Name = "Ntier vpc"
}

}

resource "aws_subnet" "subnets" {

count = length(var.subnets_cidr)
vpc_id = aws_vpc.ntier_vpc.id
cidr_block = var.subnets_cidr[count.index]
availability_zone = var.subnet_azs[count.index]

tags = {
   
   Name = var.subnet_name_tags[count.index]
}
depends_on = [
  aws_vpc.ntier_vpc
]

  
}
  
