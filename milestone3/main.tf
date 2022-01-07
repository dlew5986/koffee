module "tags" {
  source  = "./modules/tags"
  project = var.namespace
}

module "myip" {
  source = "./modules/myip"
}

module "network_3_tier" {
  source             = "./modules/network_3_tier"
  namespace          = var.namespace
  availability_zones = var.availability_zones
  source_cidr_block  = module.myip.cidr
  vpc_cidr_block     = var.vpc_cidr_block
}
