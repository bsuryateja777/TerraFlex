resource "aws_vpc_peering_connection" "this" {
  vpc_id      = var.vpc_a_id
  peer_vpc_id = var.vpc_b_id
  auto_accept = true

  tags = {
    Name = "vpc-${var.vpc_a_name}-to-${var.vpc_b_name}"
  }
}

# VPC A → VPC B
resource "aws_route" "a_to_b" {
  for_each = toset(var.vpc_a_route_table_ids)

  route_table_id            = each.value
  destination_cidr_block    = var.vpc_b_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
}

# VPC B → VPC A
resource "aws_route" "b_to_a" {
  for_each = toset(var.vpc_b_route_table_ids)

  route_table_id            = each.value
  destination_cidr_block    = var.vpc_a_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
}
