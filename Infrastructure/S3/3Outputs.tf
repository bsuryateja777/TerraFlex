output "s3_bucket_id" {
  description = "ID of the S3 bucket (same as bucket name)"
  value       = try(aws_s3_bucket.this[0].id, null)
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = try(aws_s3_bucket.this[0].arn, null)
}