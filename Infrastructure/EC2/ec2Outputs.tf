output "instance_id" {
  value = var.create_ec2_instance ? aws_instance.this[0].id : null
}

output "private_ip" {
  value = var.create_ec2_instance ? aws_instance.this[0].private_ip : null
}

output "public_ip" {
  value = var.create_ec2_instance ? aws_instance.this[0].public_ip : null
}
