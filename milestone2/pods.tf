module "pod_a" {
  source                         = "./modules/pod"
  availability_zone_name         = data.aws_availability_zone.a.name
  cidr_block_allowed_inbound_ssh = "${module.myip.my_public_ip}/32"
  cidr_block_app                 = "172.16.4.0/24"
  cidr_block_db                  = "172.16.8.0/24"
  cidr_block_public              = "172.16.1.0/24"
  key_pair_id                    = aws_key_pair.key_pair.key_pair_id
  namespace                      = local.namespace
  vpc_id                         = aws_vpc.vpc.id
}

module "pod_b" {
  source                         = "./modules/pod"
  availability_zone_name         = data.aws_availability_zone.b.name
  cidr_block_allowed_inbound_ssh = "${module.myip.my_public_ip}/32"
  cidr_block_app                 = "172.16.5.0/24"
  cidr_block_db                  = "172.16.9.0/24"
  cidr_block_public              = "172.16.2.0/24"
  key_pair_id                    = aws_key_pair.key_pair.key_pair_id
  namespace                      = local.namespace
  vpc_id                         = aws_vpc.vpc.id
}

module "pod_c" {
  source                         = "./modules/pod"
  availability_zone_name         = data.aws_availability_zone.c.name
  cidr_block_allowed_inbound_ssh = "${module.myip.my_public_ip}/32"
  cidr_block_app                 = "172.16.6.0/24"
  cidr_block_db                  = "172.16.10.0/24"
  cidr_block_public              = "172.16.3.0/24"
  key_pair_id                    = aws_key_pair.key_pair.key_pair_id
  namespace                      = local.namespace
  vpc_id                         = aws_vpc.vpc.id
}
