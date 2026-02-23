resource "aws_acm_certificate" "this" {
  domain_name       = var.domain_name
  validation_method = "EMAIL"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name        = var.acm_name
    Environment = var.env
  }
}
