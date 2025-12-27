variable "env" {
  type    = string
  default = "dev"
}

variable "create_sg" {
  type    = bool
  default = false
}

variable "sg_name" {
  type = string
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

