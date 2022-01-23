resource "aws_default_route_table" "public" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id
  tags                   = { Name = local.name_route_table_public }
}

resource "aws_route" "default_route_to_igw" {
  route_table_id         = aws_default_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public" {
  count          = var.availability_zones
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_default_route_table.public.id
}
