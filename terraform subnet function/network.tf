
#Let us create a VPC

resource "aws_vpc" "ntier_vpc" {
    cidr_block = var.vpc_cidr

tags = {

    Name = "Ntier vpc"
}

}

resource "aws_subnet" "subnets" {

count = length(var.subnet_name_tags)
vpc_id = aws_vpc.ntier_vpc.id
cidr_block = cidrsubnet(var.vpc_cidr,8,count.index)
availability_zone = var.subnet_azs[count.index]

tags = {
   
   Name = var.subnet_name_tags[count.index]
}
depends_on = [
  aws_vpc.ntier_vpc
]

  
}
  
