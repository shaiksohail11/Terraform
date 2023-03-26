resource "aws_s3_bucket" "shaik" {
  bucket = "my-first-bucket1128"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}