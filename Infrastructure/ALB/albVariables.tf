variable "env" {
  type = string
}

variable "alb_name" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "certificate_arn" {
  type    = string
  default = null
}

variable "target_type" {
  type = string # "ec2" or "ecs"
}

variable "instance_id" {
  type    = string
  default = null
}

variable "frontend_port" {
  type = number
}

variable "backend_port" {
  type = number
}

variable "enable_frontend" {
  type = bool
}

variable "enable_backend" {
  type = bool
}

variable "enable_https" {
  type = bool
}