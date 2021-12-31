resource "aws_subnet" "public_publicB" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.16.2.0/24"
  availability_zone = data.aws_availability_zone.b.name
}

resource "aws_subnet" "private_AppB" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.16.5.0/24"
  availability_zone = data.aws_availability_zone.b.name
}

resource "aws_subnet" "private_DbB" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.16.9.0/24"
  availability_zone = data.aws_availability_zone.b.name
}
