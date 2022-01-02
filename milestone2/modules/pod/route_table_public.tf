data "aws_route_table" "public" {
  route_table_id = data.aws_vpc.vpc.main_route_table_id
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = data.aws_route_table.public.id
}
