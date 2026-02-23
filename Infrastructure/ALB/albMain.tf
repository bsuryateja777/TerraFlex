resource "aws_lb" "alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_ids[0]]
  subnets            = var.public_subnet_ids

  access_logs {
  bucket  = aws_s3_bucket.this.bucket
  enabled = true
  prefix  = "alb-logs"
}

  tags = {
    Name        = var.alb_name
    Environment = var.env
  }
}

resource "aws_lb_target_group" "frontend" {
  name     = "tg-frontend-${var.alb_name}"
  port     = var.frontend_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path = "/health"
  }
}

resource "aws_lb_target_group" "backend" {
  name     = "tg-backend-${var.alb_name}"
  port     = var.backend_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path = "/api/health"
  }
}

resource "aws_lb_target_group_attachment" "frontend" {
  target_group_arn = aws_lb_target_group.frontend.arn
  target_id        = var.frontend_instance_id
  port             = var.frontend_port
}

resource "aws_lb_target_group_attachment" "backend" {
  target_group_arn = aws_lb_target_group.backend.arn
  target_id        = var.backend_instance_id
  port             = var.backend_port
}