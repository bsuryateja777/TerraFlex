output "vpc_id" {
  value = try(aws_vpc.this[0].id, null)
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "intra_subnet_ids" {
  value = aws_subnet.intra[*].id
}

output "igw_id" {
  value = try(aws_internet_gateway.this[0].id, null)
}

output "public_route_table_id" {
  value = try(aws_route_table.public[0].id, null)
}

output "private_route_table_id" {
  value = try(aws_route_table.private[0].id, null)
}

output "intra_route_table_id" {
  value = try(aws_route_table.intra[0].id, null)
}