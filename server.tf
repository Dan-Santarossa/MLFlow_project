resource "random_password" "mlflow_password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "aws_apprunner_service" "mlflow_server" {
  service_name = local.name

  source_configuration {
    auto_deployments_enabled = false

    image_repository {
      image_identifier      = "public.ecr.aws/t9j8s4z8/mlflow:1.30.0"
      image_repository_type = "ECR_PUBLIC"
      image_configuration {
        port = local.app_port
        image_configuration {
          port = local.app_port
          runtime_environment_variables = {
            "MLFLOW_ARTIFACT_URI"               = "s3://${module.s3.artifact_bucket_id}"
            "MLFLOW_DB_DIALECT"                 = "postgresql"
            "MLFLOW_DB_USERNAME"                = "${aws_rds_cluster.mlflow_backend_store.master_username}"
            "MLFLOW_DB_PASSWORD"                = "${random_password.mlflow_backend_store.result}"
            "MLFLOW_DB_HOST"                    = "${aws_rds_cluster.mlflow_backend_store.endpoint}"
            "MLFLOW_DB_PORT"                    = "${aws_rds_cluster.mlflow_backend_store.port}"
            "MLFLOW_DB_DATABASE"                = "${aws_rds_cluster.mlflow_backend_store.database_name}"
            "MLFLOW_TRACKING_USERNAME"          = var.mlflow_username
            "MLFLOW_TRACKING_PASSWORD"          = local.mlflow_password
            "MLFLOW_SQLALCHEMYSTORE_POOL_CLASS" = "NullPool"
          }
        }
      }
    }
  }
}