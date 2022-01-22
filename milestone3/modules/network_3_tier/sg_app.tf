resource "aws_security_group" "app" {
  count  = var.availability_zones
  name   = "${local.name_sg_app}_${data.aws_availability_zones.available.names[count.index]}"
  vpc_id = aws_vpc.vpc.id
  tags   = { Name = "${local.name_sg_app}_${data.aws_availability_zones.available.names[count.index]}" }
}

resource "aws_security_group_rule" "app_inbound_to_icmp_echo_from_bastion" {
  count                    = var.availability_zones
  type                     = "ingress"
  description              = "inbound to icmp v4 echo from the bastion"
  from_port                = 8 # icmp type when protocol is "icmp"
  to_port                  = 0 # icmp code when protocol is "icmp"
  protocol                 = "icmp"
  source_security_group_id = aws_security_group.bastion[count.index].id
  security_group_id        = aws_security_group.app[count.index].id
}

resource "aws_security_group_rule" "app_inbound_to_ssh_from_bastion" {
  count                    = var.availability_zones
  type                     = "ingress"
  description              = "inbound to ssh from the bastion"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.bastion[count.index].id
  security_group_id        = aws_security_group.app[count.index].id
}

resource "aws_security_group_rule" "app_outbound_to_all" {
  count             = var.availability_zones
  type              = "egress"
  description       = "outbound to all"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.app[count.index].id
}
