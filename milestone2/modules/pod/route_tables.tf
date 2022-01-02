data "aws_route_table" "main" {
  route_table_id = data.aws_vpc.vpc.main_route_table_id
}

resource "aws_route_table" "private" {
  vpc_id = data.aws_vpc.vpc.id
  tags   = { Name = local.route_table_name_private }
}
