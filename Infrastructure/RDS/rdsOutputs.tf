output "rds_endpoint" {
  value       = var.create_rds ? aws_db_instance.rds[0].endpoint : null
  description = "RDS endpoint"
}

output "rds_id" {
  value = var.create_rds ? aws_db_instance.rds[0].id : null
}