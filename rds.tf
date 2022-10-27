## -- rds.tf 

resource "random_password" "mlflow_backend_store" {
  length  = 16
  special = true

  override_special = "_+=()"
  lifecycle {
    ignore_changes = [override_special]
  }
}

resource "aws_db_subnet_group" "rds" {
  name       = "${local.name}-rds-subnet-group"
  subnet_ids = local.db_subnet_ids
}

