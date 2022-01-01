resource "aws_route" "default_route" {
  route_table_id         = aws_default_route_table.rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "publicA" {
  subnet_id = aws_subnet.public_publicA.id
  route_table_id = aws_default_route_table.rt.id
}

resource "aws_route_table_association" "publicB" {
  subnet_id = aws_subnet.public_publicB.id
  route_table_id = aws_default_route_table.rt.id
}

resource "aws_route_table_association" "publicC" {
  subnet_id = aws_subnet.public_publicC.id
  route_table_id = aws_default_route_table.rt.id
}
