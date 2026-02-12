output "vpc_peering_id" {
  description = "VPC peering connection ID"
  value       = aws_vpc_peering_connection.this.id
}

output "vpc_peering_status" {
  description = "VPC peering connection status"
  value       = aws_vpc_peering_connection.this.accept_status
}