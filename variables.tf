variable "aws_region" {
  description = "(Optional) AWS Region."
  type = string
  default = "us-east-1"
}

variable "aws_profile" {
  description = "(Optional) AWS profile to use. If not specified, the default profile will be used."
  type = string
  default = "default"
}