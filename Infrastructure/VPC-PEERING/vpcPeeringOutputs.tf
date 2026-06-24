output "vpc_peering_id" {
  description = "VPC peering connection ID"
  value       = aws_vpc_peering_connection.this.id
}

output "vpc_peering_status" {
  description = "VPC peering connection status"
  value       = aws_vpc_peering_connection.this.accept_status
}

output "vpc_a_route_table_ids" {
  value = data.aws_route_tables.vpc_a.ids
}

output "vpc_b_route_table_ids" {
  value = data.aws_route_tables.vpc_b.ids
}