output "rds_endpoint" {
  value = aws_db_instance.rds_instance.endpoint
}
output "rds_username" {
  value = aws_db_instance.rds_instance.username
}
output "rds_password" {
  value       = random_password.master_password.result
  description = "db password"
  sensitive   = true
}
