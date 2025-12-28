output "instance_id" {
  value = try(aws_instance.this[0].id, null)
}

output "private_ip" {
  value = try(aws_instance.this[0].private_ip, null)
}

output "public_ip" {
  value = try(aws_instance.this[0].public_ip, null)
}