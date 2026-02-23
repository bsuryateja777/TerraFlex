output "vpc_id" {
  value = aws_vpc.this.id
}

output "vpc_name" {
  value = aws_vpc.this.tags["Name"]
}

output "vpc_cidr_block" {
  value = aws_vpc.this.cidr_block
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
  value = length(aws_internet_gateway.this) > 0 ? aws_internet_gateway.this[0].id : null
}

output "public_route_table_id" {
  value = try(aws_route_table.public[0].id, null)
}

output "private_route_table_id" {
  value = length(aws_route_table.private) > 0 ? aws_route_table.private[0].id : null
}


output "all_route_table_ids" {
  value = concat(
    [data.aws_route_table.main.id],
    aws_route_table.public[*].id,
    aws_route_table.private[*].id,
  )
}
