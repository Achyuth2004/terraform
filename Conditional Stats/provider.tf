#resource provider
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.70.0"
    }
  }
}
#aws authentication
provider "aws"{
  # Configuration options
  region = "us-east-1"
}