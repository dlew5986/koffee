resource "aws_subnet" "public_publicC" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.16.3.0/24"
  availability_zone = data.aws_availability_zone.c.name
}

resource "aws_subnet" "private_AppC" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.16.6.0/24"
  availability_zone = data.aws_availability_zone.c.name
}

resource "aws_subnet" "private_DbC" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = data.aws_availability_zone.c.name
}
