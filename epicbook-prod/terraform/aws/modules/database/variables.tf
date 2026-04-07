# This must be defined as a list so it can hold both private_1 and private_2
variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for the RDS subnet group"
}

variable "rds_sg_id" {
  description = "Security group ID for the RDS instance"
}

variable "db_password" {
  description = "10x4comingU&M"
  sensitive   = true
}