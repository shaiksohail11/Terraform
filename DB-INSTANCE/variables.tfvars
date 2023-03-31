region = "ap-south-1"
vpc_info = {
  vpc_cidr        = "192.168.0.0/16"
  subnet_az       = ["a", "b", "a", "b", "a", "b"]
  subnet_names    = ["app1", "app2", "db1", "db2", "web1", "web2"]
  public_subnets  = ["web1", "web2"]
  private_subnets = ["app1", "app2", "db1", "db2"]
  db_subnets      = ["db1", "db2"]
  web_subnets     = ["web1", "web2"]
  web_ec2_subnet  = "web1"
}