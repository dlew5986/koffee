resource "aws_subnet" "public" {
  vpc_id            = data.aws_vpc.vpc.id
  cidr_block        = var.cidr_block_public
  availability_zone = var.availability_zone_name
  tags              = { Name = local.subnet_name_public }
}

resource "aws_subnet" "private_app" {
  vpc_id            = data.aws_vpc.vpc.id
  cidr_block        = var.cidr_block_app
  availability_zone = var.availability_zone_name
  tags              = { Name = local.subnet_name_private_app }
}

resource "aws_subnet" "private_db" {
  vpc_id            = data.aws_vpc.vpc.id
  cidr_block        = var.cidr_block_db
  availability_zone = var.availability_zone_name
  tags              = { Name = local.subnet_name_private_db }
}
