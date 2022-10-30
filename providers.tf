terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.36"
    }
  }

  required_version = ">= 1.3"

  backend "s3" {            #use your own bucket name for state storage
    bucket = "mlflow-state" #having trouble creating back end - remade an s3 bucket manually for s3 state storage - not managed by terraform
    key    = "terraform.tfstate"
    region = "us-east-1"
  }

}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}
