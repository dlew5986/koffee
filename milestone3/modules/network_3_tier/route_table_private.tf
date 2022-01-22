resource "aws_route_table" "private" {
  count  = var.availability_zones
  vpc_id = aws_vpc.vpc.id
  tags   = { Name = "${local.name_route_table_private}_${data.aws_availability_zones.available.names[count.index]}" }
}

resource "aws_route" "default_route_to_nat_gw" {
  count                  = var.availability_zones
  route_table_id         = aws_route_table.private[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw[count.index].id
}

resource "aws_route_table_association" "private_app" {
  count          = var.availability_zones
  subnet_id      = aws_subnet.app[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}

resource "aws_route_table_association" "private_db" {
  count          = var.availability_zones
  subnet_id      = aws_subnet.database[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}
