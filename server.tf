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
      }
    }
  }
}

