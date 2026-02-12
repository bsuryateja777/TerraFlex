output "nlb_dns_name" {
  description = "DNS name of the NLB"
  value       = aws_lb.nlb.dns_name
}

output "nlb_arn" {
  description = "ARN of the NLB"
  value       = aws_lb.nlb.arn
}

output "target_group_arn" {
  description = "ARN of the NLB TCP target group"
  value       = aws_lb_target_group.tcp.arn
}