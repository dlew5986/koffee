resource "aws_subnet" "public_publicA" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.16.1.0/24"
  availability_zone = data.aws_availability_zone.a.name
  tags              = { Name = "koffee_public_publicA" }
}

resource "aws_subnet" "private_AppA" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.16.4.0/24"
  availability_zone = data.aws_availability_zone.a.name
  tags              = { Name = "koffee_private_AppA" }
}

resource "aws_subnet" "private_DbA" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.16.8.0/24"
  availability_zone = data.aws_availability_zone.a.name
  tags              = { Name = "koffee_private_DbA" }
}
