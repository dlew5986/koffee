locals {
  subnet_name_public      = lower("${var.namespace}_${var.availability_zone_name}_public")
  subnet_name_private_app = lower("${var.namespace}_${var.availability_zone_name}_app")
  subnet_name_private_db  = lower("${var.namespace}_${var.availability_zone_name}_db")
}
