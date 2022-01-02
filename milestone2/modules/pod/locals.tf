locals {
  instance_name_bastion    = lower("${var.namespace}_bastion_${var.availability_zone_name}")
  eip_name                 = lower("${var.namespace}_nat_gateway_${var.availability_zone_name}")
  nat_gw_name              = lower("${var.namespace}_${var.availability_zone_name}")
  sg_name_bastion          = lower("${var.namespace}_bastion_${var.availability_zone_name}")
  subnet_name_public       = lower("${var.namespace}_public_${var.availability_zone_name}")
  subnet_name_private_app  = lower("${var.namespace}_app_${var.availability_zone_name}")
  subnet_name_private_db   = lower("${var.namespace}_db_${var.availability_zone_name}")
  route_table_name_private = lower("${var.namespace}_private_${var.availability_zone_name}")
}
