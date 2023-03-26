resource "aws_s3_bucket" "shaik" {
  bucket = "qt-thoughts-1"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}