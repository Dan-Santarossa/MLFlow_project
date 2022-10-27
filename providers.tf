terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.36"
    }
  }

  required_version = ">= 1.3"

  backend "s3" {}

}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}
