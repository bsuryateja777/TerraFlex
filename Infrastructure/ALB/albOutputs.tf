output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}

output "alb_arn" {
  value = aws_lb.alb.arn
}

output "frontend_target_group_arn" {
  value = var.enable_frontend ? aws_lb_target_group.frontend[0].arn : null
}

output "backend_target_group_arn" {
  value = var.enable_backend ? aws_lb_target_group.backend[0].arn : null
}

output "https_listener_arn" {
  value = var.certificate_arn != null && var.enable_https ? aws_lb_listener.https[0].arn : null
}

output "http_listener_arn" {
  value = aws_lb_listener.http.arn
}