resource "aws_db_instance" "this" {
  identifier = var.db_name

  engine         = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class

  allocated_storage = var.allocated_storage
  storage_type      = "gp3"

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  vpc_security_group_ids = var.rds_security_group_ids
  db_subnet_group_name   = aws_db_subnet_group.this.name

  publicly_accessible = false
  multi_az            = false
  deletion_protection = false
  skip_final_snapshot = true

  tags = {
    Name        = var.db_name
    Environment = var.env
  }
}