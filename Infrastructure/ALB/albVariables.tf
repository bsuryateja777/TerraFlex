variable "env" {
  description = "Deployment environment (dev, prod, etc.)"
  type        = string
  default     = "dev"
}

variable "alb_name" {
  description = "ALB name prefix"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs for ALB"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where ALB will be deployed"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for ALB"
  type        = list(string)
}

variable "certificate_arn" {
  description = "ACM certificate ARN for HTTPS listener"
  type        = string
}

variable "frontend_port" {
  description = "Port for frontend target group"
  type        = number
  default     = 80
}

variable "backend_port" {
  description = "Port for backend target group"
  type        = number
  default     = 4000
}

variable "frontend_instance_id" {
  description = "EC2/Amplify instance ID for frontend"
  type        = string
}

variable "backend_instance_id" {
  description = "EC2 instance ID for backend"
  type        = string
}