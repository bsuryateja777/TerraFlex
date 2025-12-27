locals {
    aws_vpc_name = "vpc-${var.env}-${var.vpc_name}"
    aws_pb_sub_name = "pb-subnet-${var.env}-${var.vpc_name}"
    aws_pv_sub_name = "pv-subnet-${var.env}-${var.vpc_name}"
    aws_in_sub_name = "in-subnet-${var.env}-${var.vpc_name}"
}