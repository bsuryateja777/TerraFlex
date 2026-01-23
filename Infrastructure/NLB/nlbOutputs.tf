output "nlb_dns_name" {
  value = var.create_nlb? aws_lb.nlb[0].dns_name : null
}

output "nlb_arn" {
  value = var.create_nlb ? aws_lb.nlb[0].arn : null
}

output "target_group_arn" {
  value = var.create_nlb ? aws_lb_target_group.tcp[0].arn : null
}