variable "aws_region" {
  description = "(Optional) AWS Region."
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "(Optional) AWS profile to use. If not specified, the default profile will be used."
  type        = string
  default     = "default"
}

variable "name" {
  description = "(Optional) A name for the application (e.g. mlflow)."
  type        = string
  default     = "mlflow"
}

variable "environment" {
  description = "(Optional) Environment. It will be part of the application name and a tag in AWS Tags."
  type        = string
  default     = "dev"
}

variable "vpc_id" {
  type        = string
  description = "(Optional) VPC ID."
  default     = null
}

variable "artifact_bucket_id" {
  type        = string
  default     = null
  description = "If specified, MLflow will use this bucket to store artifacts. Otherwise, this module will create a dedicated bucket. When overriding this value, you need to enable the task role to access the root you specified."
}

variable "mlflow_password" {
  description = "Password used in basic authentication provided by nginx. If not specified, this module will create a strong password for you."
  type        = string
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) AWS Tags common to all the resources created."
  default     = {}
}

variable "db_subnet_ids" {
  type        = list(string)
  default     = null
  description = "List of subnets where the RDS database will be deployed"
}

variable "mlflow_version" {
  description = "The mlflow-server version to use."
  type = string
  default = "latest"
}