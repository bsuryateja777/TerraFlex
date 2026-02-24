resource "aws_lb" "alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_group_ids
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