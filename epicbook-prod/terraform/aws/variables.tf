variable "aws_region" {
  description = "The AWS region to deploy the EpicBook infrastructure"
  default     = "ca-central-1"
}

variable "db_password" {
  description = "The master password for the RDS MySQL instance"
  type        = string
  sensitive   = true
}

variable "key_name" {
  description = "The name of your existing AWS Key Pair for SSH access"
  type        = string
}