resource "aws_route" "default_route" {
  route_table_id         = aws_default_route_table.rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}
