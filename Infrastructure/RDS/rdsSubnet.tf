resource "aws_db_subnet_group" "this" {
  count      = var.create_rds ? 1 : 0
  name       = "${local.aws_rds_name}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name        = "${local.aws_rds_name}-subnet-group"
    Environment = var.env
  }
}