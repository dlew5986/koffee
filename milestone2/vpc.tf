resource "aws_vpc" "vpc" {
  cidr_block = local.vpc_cidr_block
  tags       = { Name = local.namespace }
}
