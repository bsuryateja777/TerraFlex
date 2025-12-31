output "alb_dns_name" {
  value = var.create_alb ? aws_lb.this[0].dns_name : null
}

output "alb_arn" {
  value = var.create_alb ? aws_lb.this[0].arn : null
}

output "frontend_target_group_arn" {
  value = var.create_alb ? aws_lb_target_group.frontend[0].arn : null
}

output "backend_target_group_arn" {
  value = var.create_alb ? aws_lb_target_group.backend[0].arn : null
}