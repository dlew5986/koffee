resource "aws_eip" "eip" {
  count = var.availability_zones
  vpc   = true
  tags  = { Name = "${local.name_eip}_${data.aws_availability_zones.available.names[count.index]}" }
}

resource "aws_nat_gateway" "nat_gw" {
  count         = var.availability_zones
  allocation_id = aws_eip.eip[count.index].id
  subnet_id     = aws_subnet.public[count.index].id
  tags          = { Name = "${local.name_nat_gw}_${data.aws_availability_zones.available.names[count.index]}" }
}
