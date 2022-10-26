variable "tags" {
  type        = map(string)
  default     = {}
  description = "AWS Tags common to all the resources created"
}
