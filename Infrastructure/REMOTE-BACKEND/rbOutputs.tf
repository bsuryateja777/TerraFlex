output "bucket_name" {
  description = "Terraform state bucket name"
  value       = aws_s3_bucket.tf_state.bucket
}

output "dynamodb_table_name" {
  description = "Terraform lock table name"
  value       = aws_dynamodb_table.tf_locks.name
}