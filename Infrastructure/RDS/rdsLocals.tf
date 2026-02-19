locals {
  aws_rds_name = replace(var.db_name, "-", "")
}
