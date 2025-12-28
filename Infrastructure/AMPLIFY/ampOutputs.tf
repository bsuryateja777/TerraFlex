output "amplify_app_id" {
  value = var.create_amplify_app ? aws_amplify_app.this[0].id : null
}

output "amplify_app_url" {
  value = var.create_amplify_app ? "https://${aws_amplify_branch.this[0].branch_name}.${aws_amplify_app.this[0].default_domain}" : null
}