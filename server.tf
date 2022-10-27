resource "random_password" "mlflow_password" {
  length           = 16
  special          = true
  override_special = "_%@"
}