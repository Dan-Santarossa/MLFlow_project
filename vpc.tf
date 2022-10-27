module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.12"

  name = var.unique_name

  cidr = "10.1.0.0/16"

  azs = data.aws_availability_zones.available.names

}