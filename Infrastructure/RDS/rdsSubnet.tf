resource "aws_db_subnet_group" "this" {
  name       = "${local.aws_rds_name}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name        = "${local.aws_rds_name}-subnet-group"
    Environment = var.env
  }
}