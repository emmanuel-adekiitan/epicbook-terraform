output "ec2_public_ip" {
  description = "The public IP address of the EpicBook Web Server"
  value       = module.compute.public_ip
}

output "rds_endpoint" {
  description = "The connection endpoint for the MySQL Database"
  value       = module.database.db_endpoint
}