resource "aws_route_table" "private" {
  vpc_id = data.aws_vpc.vpc.id
  tags   = { Name = local.route_table_name_private }
}

resource "aws_route" "default_route_to_nat_gw" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw.id
}
