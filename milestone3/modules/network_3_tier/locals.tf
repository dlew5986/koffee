locals {
  name_eip                 = var.namespace
  name_igw                 = var.namespace
  name_instance_app        = "${var.namespace}_app"
  name_instance_bastion    = "${var.namespace}_bastion"
  name_key_pair            = var.namespace
  name_nat_gw              = var.namespace
  name_route_table_private = "${var.namespace}_private"
  name_route_table_public  = "${var.namespace}_public"
  name_sg_app              = "${var.namespace}_app"
  name_sg_bastion          = "${var.namespace}_bastion"
  name_subnet_public       = "${var.namespace}_public"
  name_subnet_app          = "${var.namespace}_app"
  name_subnet_database     = "${var.namespace}_database"
  name_vpc                 = var.namespace

  cidr_block_public   = cidrsubnet(var.vpc_cidr_block, 4, 0)
  cidr_block_app      = cidrsubnet(var.vpc_cidr_block, 4, 1)
  cidr_block_database = cidrsubnet(var.vpc_cidr_block, 4, 2)
}
