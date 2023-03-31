
resource "aws_vpc" "ntier" {
  cidr_block = var.vpc_info.vpc_cidr

  tags = {
    Name = "ntier"
  }

}

resource "aws_subnet" "app1" {
  count             = length(var.vpc_info.subnet_names)
  vpc_id            = aws_vpc.ntier.id
  availability_zone = "${var.region}${var.vpc_info.subnet_az[count.index]}"
  cidr_block        = cidrsubnet(var.vpc_info.vpc_cidr, 8, count.index)
  tags = {
    Name = var.vpc_info.subnet_names[count.index]
  }
  depends_on = [
    aws_vpc.ntier
  ]

}

resource "aws_internet_gateway" "ntier_igw" {
  vpc_id = local.vpc
  tags = {
    Name = "ntier-igw"
  }
  depends_on = [
    aws_vpc.ntier
  ]
}

resource "aws_route_table" "private" {
  vpc_id = local.vpc
  tags = {
    Name = "private"
  }
  depends_on = [
    aws_subnet.app1
  ]
}


resource "aws_route_table" "public" {
  vpc_id = local.vpc
  tags = {
    Name = "public"
  }
  route {
    cidr_block = local.anywhere
    gateway_id = aws_internet_gateway.ntier_igw.id
  }
  depends_on = [
    aws_subnet.app1
  ]
}

data "aws_subnets" "public" {
  filter {
    name   = "tag:Name"
    values = var.vpc_info.public_subnets
  }
  filter {
    name   = "vpc-id"
    values = [local.vpc]
  }
  depends_on = [
    aws_subnet.app1
  ]
}

data "aws_subnets" "private" {
  filter {
    name   = "tag:Name"
    values = var.vpc_info.private_subnets
  }
  filter {
    name   = "vpc-id"
    values = [local.vpc]
  }
  depends_on = [
    aws_subnet.app1
  ]
}


resource "aws_route_table_association" "public_assosiations" {
  count          = length(data.aws_subnets.public.ids)
  route_table_id = aws_route_table.public.id
  subnet_id      = data.aws_subnets.public.ids[count.index]
}

resource "aws_route_table_association" "private_assosiations" {
  count          = length(data.aws_subnets.private.ids)
  route_table_id = aws_route_table.private.id
  subnet_id      = data.aws_subnets.private.ids[count.index]

}

