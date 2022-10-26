variable "tags" {
  type        = map(string)
  default     = {}
  description = "AWS Tags common to all the resources created"
}

variable "unique_name" {
  type        = string
  description = "A unique name for this application"
  default     = "oauth2-mlflow"
}