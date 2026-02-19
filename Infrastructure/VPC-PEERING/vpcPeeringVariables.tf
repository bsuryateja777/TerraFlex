variable "vpc_a_id" {
  description = "Requester VPC ID"
  type        = string
}

variable "vpc_b_id" {
  description = "Accepter VPC ID"
  type        = string
}

variable "vpc_a_route_table_ids" {
  type = list(string)
}

variable "vpc_b_route_table_ids" {
  type = list(string)
}


variable "vpc_a_cidr_block" {
  description = "CIDR block of VPC A"
  type        = string
}

variable "vpc_b_cidr_block" {
  description = "CIDR block of VPC B"
  type        = string
}

variable "vpc_a_name" {
  description = "Name of VPC A"
  type        = string
}

variable "vpc_b_name" {
  description = "Name of VPC B"
  type        = string
}