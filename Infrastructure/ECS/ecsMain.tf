resource "aws_ecs_cluster" "this" {
  name = "${var.ecs_name}-cluster"
}


resource "aws_ecs_service" "this" {
  name            = "${var.ecs_name}-service"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.this.arn
  desired_count   = 2
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.private_subnets
    security_groups  = [var.security_group_id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs.arn
    container_name   = "app"
    container_port   = 5000
  }

  depends_on = [
    aws_lb_listener_rule.ecs
  ]
}