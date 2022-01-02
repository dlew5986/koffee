resource "aws_default_route_table" "public" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id
  tags                   = { Name = local.route_table_name }
}

resource "aws_route" "default_route_to_igw" {
  route_table_id         = aws_default_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}
