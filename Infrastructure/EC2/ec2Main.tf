resource "aws_instance" "this" {
  ami                         = var.ami_id
  instance_type               = var.ec2_instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip

  tags = {
    Name        = local.aws_ec2_instance_name
    Environment = var.env
  }
}
