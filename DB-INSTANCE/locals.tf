locals {
  vpc       = aws_vpc.ntier.id
  anywhere  = "0.0.0.0/0"
  mysqlport = 3306
  ssh_port  = 22
  http_port = 80
  ami_id    = data.aws_ami_ids.ubuntu.ids[0]

}