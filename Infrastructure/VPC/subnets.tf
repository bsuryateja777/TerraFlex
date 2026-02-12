resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidrs)

  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.azs[count.index]}-${local.aws_pb_sub_name}"
    Environment = var.env
  }
}

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidrs)

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name        = "${var.azs[count.index]}-${local.aws_pv_sub_name}"
    Environment = var.env
  }
}

resource "aws_subnet" "intra" {
  count = length(var.intra_subnet_cidrs)

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.intra_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name        = "${var.azs[count.index]}-${local.aws_in_sub_name}"
    Environment = var.env
  }
}