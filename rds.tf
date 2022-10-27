resource "aws_db_subnet_group" "rds" {
  name       = "${var.unique_name}-rds"
  subnet_ids = module.vpc.database_subnets
}

resource "aws_security_group" "rds" {
  name   = "${var.unique_name}-rds"
  vpc_id = module.vpc.vpc_id
  tags   = local.tags
}

