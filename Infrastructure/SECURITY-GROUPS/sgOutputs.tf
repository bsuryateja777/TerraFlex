output "security_group_id" {
  description = "ID of the security group"
  value       = try(aws_security_group.this[0].id, null)
}

output "security_group_arn" {
  description = "ARN of the security group"
  value       = try(aws_security_group.this[0].arn, null)
}
