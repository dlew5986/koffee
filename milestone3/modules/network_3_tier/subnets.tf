resource "aws_subnet" "public" {
  count = var.availability_zones

  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = cidrsubnet(local.cidr_block_public, 4, count.index)
  vpc_id            = aws_vpc.vpc.id

  tags = { Name = "${local.name_subnet_public}_${data.aws_availability_zones.available.names[count.index]}" }
}

resource "aws_subnet" "app" {
  count = var.availability_zones

  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = cidrsubnet(local.cidr_block_app, 4, count.index)
  vpc_id            = aws_vpc.vpc.id

  tags = { Name = "${local.name_subnet_app}_${data.aws_availability_zones.available.names[count.index]}" }
}

resource "aws_subnet" "database" {
  count = var.availability_zones

  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = cidrsubnet(local.cidr_block_database, 4, count.index)
  vpc_id            = aws_vpc.vpc.id

  tags = { Name = "${local.name_subnet_database}_${data.aws_availability_zones.available.names[count.index]}" }
}
