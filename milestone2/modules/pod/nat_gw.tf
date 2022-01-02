resource "aws_eip" "eip" {
  vpc  = true
  tags = { Name = local.eip_name }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public.id
  tags          = { Name = local.nat_gw_name }
}
