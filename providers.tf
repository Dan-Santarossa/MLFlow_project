terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.3"
    }
  }
backend "s3" {
    key     = "state"
    encrypt = true
  }
}
provider "aws" {
  # Configuration options
}