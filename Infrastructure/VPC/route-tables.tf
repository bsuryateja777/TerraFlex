# ------------------------
# Public Route Table
# ------------------------
resource "aws_route_table" "public" {
  count = var.create_vpc && var.create_route_tables && var.create_public_subnets ? 1 : 0

  vpc_id = aws_vpc.this[0].id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.create_igw ? aws_internet_gateway.this[0].id : null
  }

  tags = {
    Name = var.vpc_name
    Environment = var.env
  }
}

resource "aws_route_table_association" "public" {
  count = length(aws_subnet.public)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public[0].id
}


# ------------------------
# Private Route Table (no default route)
# ------------------------
resource "aws_route_table" "private" {
  count = var.create_vpc && var.create_route_tables && var.create_private_subnets ? 1 : 0

  vpc_id = aws_vpc.this[0].id

  tags = {
    Name = var.vpc_name
    Environment = var.env
  }
}

resource "aws_route_table_association" "private" {
  count = length(aws_subnet.private)

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[0].id
}


# ------------------------
# Intra Route Table (isolated)
# ------------------------
resource "aws_route_table" "intra" {
  count = var.create_vpc && var.create_route_tables && var.create_intra_subnets ? 1 : 0

  vpc_id = aws_vpc.this[0].id

  tags = {
    Name = var.vpc_name
    Environment = var.env
  }
}

resource "aws_route_table_association" "intra" {
  count = length(aws_subnet.intra)

  subnet_id      = aws_subnet.intra[count.index].id
  route_table_id = aws_route_table.intra[0].id
}
