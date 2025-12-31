resource "aws_lb" "this" {
  count              = var.create_alb ? 1 : 0
  name               = local.aws_alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_ids[0]]
  subnets            = var.public_subnet_ids

  tags = {
    Name = local.aws_alb_name
    Environment = var.env
  }
}

resource "aws_lb_target_group" "frontend" {
  count    = var.create_alb ? 1 : 0
  name     = "tg-frontend-${local.aws_alb_name}"
  port     = var.frontend_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path = "/health"
  }
}

resource "aws_lb_target_group" "backend" {
  count    = var.create_alb ? 1 : 0
  name     = "tg-backend-${local.aws_alb_name}"
  port     = var.backend_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path = "/api/health"
  }
}

resource "aws_lb_target_group_attachment" "frontend" {
  count            = var.create_alb ? 1 : 0
  target_group_arn = aws_lb_target_group.frontend[0].arn
  target_id        = var.frontend_instance_id
  port             = var.frontend_port
}

resource "aws_lb_target_group_attachment" "backend" {
  count            = var.create_alb ? 1 : 0
  target_group_arn = aws_lb_target_group.backend[0].arn
  target_id        = var.backend_instance_id
  port             = var.backend_port
}