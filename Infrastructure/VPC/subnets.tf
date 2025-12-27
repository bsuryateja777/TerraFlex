# ------------------------
# Public Subnets
# ------------------------
resource "aws_subnet" "public" {

  count = var.create_vpc && var.create_public_subnets ? length(var.public_subnet_cidrs) : 0

  vpc_id                  = aws_vpc.this[0].id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = local.aws_pb_sub_name
    Environment = var.env
  }
}

# ------------------------
# Private Subnets
# ------------------------
resource "aws_subnet" "private" {
  count = var.create_vpc && var.create_private_subnets ? length(var.private_subnet_cidrs) : 0

  vpc_id            = aws_vpc.this[0].id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = local.aws_pv_sub_name
    Environment = var.env
  }
}

# ------------------------
# Intra Subnets (No Internet)
# ------------------------
resource "aws_subnet" "intra" {
  count = var.create_vpc && var.create_intra_subnets ? length(var.intra_subnet_cidrs) : 0

  vpc_id            = aws_vpc.this[0].id
  cidr_block        = var.intra_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = local.aws_in_sub_name
    Environment = var.env
  }
}
