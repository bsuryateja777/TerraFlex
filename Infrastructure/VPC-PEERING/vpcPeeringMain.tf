data "aws_vpc" "vpc_a" {
  id = var.vpc_a_id
}

data "aws_vpc" "vpc_b" {
  id = var.vpc_b_id
}


# -> VPC Peering Connection
resource "aws_vpc_peering_connection" "this" {
  vpc_id      = var.vpc_a_id
  peer_vpc_id = var.vpc_b_id
  auto_accept = true

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  tags = {
    Name = "vpc-${data.aws_vpc.vpc_a.cidr_block}-to-${data.aws_vpc.vpc_b.cidr_block}"
  }
}

# Fetch Route Tables
data "aws_route_tables" "vpc_a" {
  vpc_id = var.vpc_a_id
}

data "aws_route_tables" "vpc_b" {
  vpc_id = var.vpc_b_id
}


# Routes: VPC A → VPC B
resource "aws_route" "a_to_b" {
  for_each = toset(data.aws_route_tables.vpc_a.ids)

  route_table_id            = each.value
  destination_cidr_block    = data.aws_vpc.vpc_b.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
}


# Routes: VPC B → VPC A
resource "aws_route" "b_to_a" {
  for_each = toset(data.aws_route_tables.vpc_b.ids)

  route_table_id            = each.value
  destination_cidr_block    = data.aws_vpc.vpc_a.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
}
