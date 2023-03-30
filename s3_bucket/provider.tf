terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  # here we have to create s3 bucket and a DynamoDB table with value LockID 
  backend "s3" {
    bucket = "terraformremotebackend"
    key = "terraform/lockfile"
    dynamodb_table = "my-table"
    region = "us-west-2"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

