locals {
  eip_name                 = lower("${var.namespace}_nat_gateway_${var.availability_zone_name}")
  nat_gw_name              = lower("${var.namespace}_${var.availability_zone_name}")
  subnet_name_public       = lower("${var.namespace}_${var.availability_zone_name}_public")
  subnet_name_private_app  = lower("${var.namespace}_${var.availability_zone_name}_app")
  subnet_name_private_db   = lower("${var.namespace}_${var.availability_zone_name}_db")
  route_table_name_private = lower("${var.namespace}_${var.availability_zone_name}_private")
}
