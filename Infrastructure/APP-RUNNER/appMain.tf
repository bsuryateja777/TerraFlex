resource "aws_apprunner_service" "app_service" {
  service_name = var.app_runner_name

  source_configuration {

    auto_deployments_enabled = true 
    
    authentication_configuration {
      access_role_arn = aws_iam_role.apprunner_role.arn
    }

    image_repository {
      image_identifier      = "${var.ecr_repo_url}:latest"
      image_repository_type = "ECR"

      image_configuration {
        port = var.container_port
      }
    }

    auto_deployments_enabled = false
  }

  instance_configuration {
    cpu    = "1024"
    memory = "2048"
  }

  health_check_configuration {
    path                = "/"
    interval            = 10
    timeout             = 5
    healthy_threshold   = 1
    unhealthy_threshold = 5
  }
}