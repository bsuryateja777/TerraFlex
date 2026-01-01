output "nlb_dns_name" {
  value = aws_lb.nlb[0].dns_name
}

output "nlb_arn" {
  value = aws_lb.nlb[0].arn
}

output "target_group_arn" {
  value = aws_lb_target_group.tcp[0].arn
}