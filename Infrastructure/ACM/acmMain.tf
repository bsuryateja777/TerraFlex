resource "aws_acm_certificate" "this" {

  count = var.create_acm ? 1 : 0

  domain_name       = var.domain_name
  validation_method = "EMAIL"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name        = local.aws_acm_name
    Environment = var.env
  }
}