output "certificate_arn" {
  value = var.create_acm ? aws_acm_certificate.this[0].arn : null
}
