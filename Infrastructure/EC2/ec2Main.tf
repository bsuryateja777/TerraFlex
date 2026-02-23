resource "aws_instance" "this" {
  ami                         = var.ami_id
  instance_type               = var.ec2_instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip

  iam_instance_profile = aws_iam_instance_profile.this.name

  user_data = templatefile("${path.module}/user_data.sh", {
    log_group_name = var.monitoring_log_group_name
  })

  tags = {
    Name        = var.ec2_instance_name
    Environment = var.env
  }
}
