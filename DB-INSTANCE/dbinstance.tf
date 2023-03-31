resource "aws_security_group" "db" {
  name = "mysql"
  ingress {
    from_port   = local.mysqlport
    to_port     = local.mysqlport
    protocol    = "tcp"
    cidr_blocks = [var.vpc_info.vpc_cidr]
  }
  tags = {
    Name = "mysql"
  }
  vpc_id = local.vpc
  depends_on = [
    aws_subnet.app1
  ]
}

data "aws_subnets" "db" {
  filter {
    name   = "tag:Name"
    values = var.vpc_info.db_subnets
  }
  filter {
    name   = "vpc-id"
    values = [local.vpc]
  }
  depends_on = [
    aws_subnet.app1
  ]

}


resource "aws_db_subnet_group" "ntier" {
  name       = "ntier"
  subnet_ids = data.aws_subnets.db.ids
  depends_on = [
    aws_subnet.app1
  ]
}

resource "aws_db_instance" "empdb" {
  allocated_storage      = 20
  db_name                = "empdb"
  engine                 = "mysql"
  engine_version         = "8.0.32"
  instance_class         = "db.t3.micro"
  username               = "jaya"
  password               = "adminadmin"
  skip_final_snapshot    = true
  publicly_accessible    = false
  db_subnet_group_name   = "ntier"
  vpc_security_group_ids = [aws_security_group.db.id]

  depends_on = [
    aws_security_group.db,
    aws_db_subnet_group.ntier
  ]

}