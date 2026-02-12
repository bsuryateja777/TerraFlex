output "amplify_app_id" {
  description = "Amplify App ID"
  value       = aws_amplify_app.this.id
}

output "amplify_app_url" {
  description = "Amplify App URL"
  value       = "https://${aws_amplify_branch.this.branch_name}.${aws_amplify_app.this.default_domain}"
}