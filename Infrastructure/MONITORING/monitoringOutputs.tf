output "log_group_name" {
  value = aws_cloudwatch_log_group.cloudtrail.name
}

output "log_group_arn" {
  value = aws_cloudwatch_log_group.cloudtrail.arn
}

output "sns_topic_arn" {
  value = aws_sns_topic.alerts.arn
}

output "cloudtrail_s3_bucket" {
  value = aws_s3_bucket.cloudtrail.bucket
}

output "cloudtrail_role_arn" {
  value = aws_iam_role.cloudtrail.arn
}