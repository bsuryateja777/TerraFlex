locals {
  aws_vpc_name    = "vpc-${var.vpc_name}"
  aws_pb_sub_name = "pb-subnet-${var.vpc_name}"
  aws_pv_sub_name = "pv-subnet-${var.vpc_name}"
  aws_in_sub_name = "in-subnet-${var.vpc_name}"
}