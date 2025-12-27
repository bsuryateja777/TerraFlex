resource "aws_vpc" "this" {

  count = var.create_vpc ? 1 : 0

  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = local.aws_vpc_name
    Environment = var.env
  }
}
