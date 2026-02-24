resource "aws_lb_target_group" "frontend" {
  count = var.enable_frontend ? 1 : 0

  name        = "tg-frontend-${var.alb_name}"
  port        = var.frontend_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = var.target_type == "ecs" ? "ip" : "instance"

  health_check {
    path = "/health"
  }
}



resource "aws_lb_target_group" "backend" {
  count = var.enable_backend ? 1 : 0

  name        = "tg-backend-${var.alb_name}"
  port        = var.backend_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = var.target_type == "ecs" ? "ip" : "instance"

  health_check {
    path = "/api/health"
  }
}
