resource "aws_db_subnet_group" "rds" {
  name       = "${var.unique_name}-rds"
  subnet_ids = module.vpc.database_subnets
}