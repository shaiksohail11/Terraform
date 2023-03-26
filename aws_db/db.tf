resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb-test"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "root"
  password             = "rootroot"
  skip_final_snapshot  = true

  tags = {
    "Name" = "Main-DB"
  }
}