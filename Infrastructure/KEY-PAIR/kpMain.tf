resource "tls_private_key" "this" {
  count = var.create_key_pair ? 1 : 0

  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "this" {
  count = var.create_key_pair ? 1 : 0

  key_name   = "${var.project_name}-key"
  public_key = tls_private_key.this[0].public_key_openssh
}

resource "local_file" "ec2_private_key" {
  count = var.create_key_pair ? 1 : 0

  sensitive_content = tls_private_key.this[0].private_key_pem
  filename          = "${path.module}/keys/${var.project_name}.pem"
  file_permission   = "0600"
}
