resource "aws_vpc_peering_connection" "peer" {
  count = var.enable_vpc_peering && var.vpc_a_id != null && var.vpc_b_id != null ? 1 : 0

  vpc_id      = var.vpc_a_id
  peer_vpc_id = var.vpc_b_id
  auto_accept = true

  tags = {
    Name = "vpc-a-to-vpc-b"
  }
}


resource "aws_route" "a_to_b" {
  count = length(aws_vpc_peering_connection.peer) > 0 ? 1 : 0

  route_table_id            = var.vpc_a_rt_id
  destination_cidr_block    = var.vpc_b_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer[0].id
}


resource "aws_route" "b_to_a" {
  count = length(aws_vpc_peering_connection.peer) > 0 ? 1 : 0

  route_table_id            = var.vpc_b_rt_id
  destination_cidr_block    = var.vpc_a_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer[0].id
}