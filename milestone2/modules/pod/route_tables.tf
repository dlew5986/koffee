data "aws_route_table" "main" {
  route_table_id = data.aws_vpc.vpc.main_route_table_id
}
