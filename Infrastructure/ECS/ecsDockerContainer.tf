resource "aws_ecs_task_definition" "this" {
  family                   = "${var.ecs_name}-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.this.arn

  container_definitions = jsonencode([
    {
      name      = "app"
      image     = var.container_image # e.g. ECR image URL
      essential = true
      portMappings = [{
        containerPort = 5000
        hostPort      = 5000
      }]

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = var.aws_cloudwatch_log_group_name
          awslogs-region        = var.region
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}