output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.all_in_one_sg.id
}

output "security_group_arn" {
  description = "ARN of the security group"
  value       = aws_security_group.all_in_one_sg.arn
}
