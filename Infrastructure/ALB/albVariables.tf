variable "env" {
  default = "dev"
  type = string
}

variable "create_alb" {
  description = "Whether to create ALB resources"
  type        = bool
  default     = true
}

variable "alb_name" {
  description = "ALB name prefix"
  type        = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for ALB"
  type        = list(string)
}

variable "certificate_arn" {
  description = "ACM certificate ARN for HTTPS"
  type        = string
}

variable "frontend_port" {
  type    = number
  default = 80
}

variable "backend_port" {
  type    = number
  default = 5000
}

variable "frontend_instance_id" {
  description = "EC2 instance ID for frontend"
  type        = string
}

variable "backend_instance_id" {
  description = "EC2 instance ID for backend"
  type        = string
}