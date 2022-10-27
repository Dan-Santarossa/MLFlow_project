terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.36"
    }
  }
}
# backend "s3" {}
# # #     key     = "state"
# # #     encrypt = true
# # #   }
# # # 
# # provider "aws" {
# #   # Configuration options
# #  }
# # } 

provider "aws" {
  profile = var.aws_profile
  region = var.aws_region
}