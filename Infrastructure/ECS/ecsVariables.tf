variable "ecs_name" {
  type = string
}

variable "container_image" {
  type = string
}

variable "aws_cloudwatch_log_group_name" {
  type = string
}

variable "region" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "alb_listener_arn" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}
