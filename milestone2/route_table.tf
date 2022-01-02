resource "aws_default_route_table" "rt" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id
  tags                   = { Name = local.route_table_name }
}
