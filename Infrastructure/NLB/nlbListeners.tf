resource "aws_lb_listener" "tcp" {

  count = var.create_nlb ? 1 : 0

  load_balancer_arn = aws_lb.nlb[0].arn
  port              = var.listener_port
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tcp[0].arn
  }
}