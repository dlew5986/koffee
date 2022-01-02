locals {
  aws_region     = "us-east-2"
  namespace      = "koffee"
  vpc_cidr_block = "172.16.0.0/16"

  igw_name         = lower("${local.namespace}")
  key_pair_name    = lower("${local.namespace}")
  route_table_name = lower("${local.namespace}_public")
  vpc_name         = lower("${local.namespace}")
}
