resource "aws_route_table" "public" {
  count = length(aws_subnet.public) > 0 ? 1 : 0

  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this[0].id
  }

  tags = {
    Name        = "${local.aws_vpc_name}-public"
    Environment = var.env
  }
}

resource "aws_route_table_association" "public" {
  count = length(aws_subnet.public)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public[0].id
}

resource "aws_route_table" "private" {
  count  = length(aws_subnet.private) > 0 ? 1 : 0
  vpc_id = aws_vpc.this.id

  tags = {
    Name        = "${local.aws_vpc_name}-private"
    Environment = var.env
  }
}

resource "aws_route_table_association" "private" {
  count = length(aws_subnet.private)

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[0].id
}
