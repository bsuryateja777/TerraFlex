resource "aws_lb_target_group_attachment" "frontend" {
  count = var.enable_frontend && var.target_type == "ec2" && var.instance_id != null ? 1 : 0

  target_group_arn = aws_lb_target_group.frontend[0].arn
  target_id        = var.instance_id
  port             = var.frontend_port
}


resource "aws_lb_target_group_attachment" "backend" {
  count = var.enable_backend && var.target_type == "ec2" && var.instance_id != null ? 1 : 0

  target_group_arn = aws_lb_target_group.backend[0].arn
  target_id        = var.instance_id
  port             = var.backend_port
}