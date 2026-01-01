resource "aws_lb" "nlb" {

  count = var.create_nlb ? 1 : 0

  name               = local.aws_nlb_name
  internal           = var.internal_nlb
  load_balancer_type = "network"

  subnets = var.subnet_ids

  enable_deletion_protection       = var.nlb_deletion_protection
  enable_cross_zone_load_balancing = var.nlb_enable_cross_zone

  tags = {
    Name        = local.aws_nlb_name
    Environment = var.env
  }
}

resource "aws_lb_target_group" "tcp" {

  count = var.create_nlb ? 1 : 0

  name        = "tg-tcp-${local.aws_nlb_name}"
  port        = var.target_port
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = var.target_type # instance | ip

  deregistration_delay = var.deregistration_delay

  health_check {
    protocol            = "TCP"
    port                = "traffic-port"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 10
    interval            = 30
  }

  tags = {
    Name        = "tg-tcp-${local.aws_nlb_name}"
    Environment = var.env
  }
}

resource "aws_lb_target_group_attachment" "ec2" {

  count = var.create_nlb ? 1 : 0

  for_each = toset(var.instance_ids)

  target_group_arn = aws_lb_target_group.tcp[0].arn
  target_id        = each.value
  port             = var.target_port
}