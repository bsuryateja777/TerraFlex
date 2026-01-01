variable "env" {
  type    = string
  default = "dev"
}

variable "create_nlb" {
  default = false
  type    = bool
}

variable "nlb_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "instance_ids" {
  type = list(string)
}

variable "listener_port" {
  default = 443
}

variable "target_port" {
  default = 443
}

variable "internal_nlb" {
  default = false
}

variable "target_type" {
  default = "instance"
}

variable "nlb_enable_cross_zone" {
  type = bool
}

variable "nlb_deletion_protection" {
  type = bool
}

variable "deregistration_delay" {
  default = 300
}
