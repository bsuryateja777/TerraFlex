variable "enable_vpc_peering" {
  default = false
  type    = bool
}

variable "vpc_a_id" {
  type    = string
  default = null
}

variable "vpc_b_id" {
  type    = string
  default = null
}

variable "vpc_a_rt_id" {
  type    = string
  default = null
}

variable "vpc_b_rt_id" {
  type    = string
  default = null
}

variable "vpc_a_cidr_block" {
  type    = string
  default = null
}

variable "vpc_b_cidr_block" {
  type    = string
  default = null
}