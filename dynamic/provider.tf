#resource provider
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.70.0"
    }
  }
  backend "s3" {
    bucket = "ach-remote-state"
    key    = "dynamic-alloc"
    region = "us-east-1"
    dynamodb_table = "remote-locking"
  }
}

#aws authentication
provider "aws" {
  # Configuration options
  region = "us-east-1"
}