locals {
  name_eip                 = "${var.namespace}_eip"
  name_igw                 = "${var.namespace}_igw"
  name_key_pair            = "${var.namespace}_key_pair"
  name_nat_gw              = "${var.namespace}_natgw"
  name_route_table_private = "${var.namespace}_private"
  name_route_table_public  = "${var.namespace}_public"
  name_subnet_public       = "${var.namespace}_public"
  name_subnet_app          = "${var.namespace}_app"
  name_subnet_database     = "${var.namespace}_database"
  name_vpc                 = "${var.namespace}_vpc"

  cidr_block_public   = cidrsubnet(var.vpc_cidr_block, 4, 0)
  cidr_block_app      = cidrsubnet(var.vpc_cidr_block, 4, 1)
  cidr_block_database = cidrsubnet(var.vpc_cidr_block, 4, 2)
}
