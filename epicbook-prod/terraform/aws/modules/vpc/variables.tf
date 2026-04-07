variable "region" {
  type        = string
  description = "The AWS region (e.g., ca-central-1) passed from the root"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}