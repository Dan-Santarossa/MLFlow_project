## -- network.tf

resource "aws_vpc" "mlflow_vpc" {
  count                = local.create_dedicated_vpc ? 1 : 0
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${local.name}-vpc"
  }
}