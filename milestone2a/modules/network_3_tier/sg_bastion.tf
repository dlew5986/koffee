resource "aws_security_group" "bastion" {
  count  = var.availability_zones
  name   = "${local.name_sg_bastion}_${data.aws_availability_zones.available.names[count.index]}"
  vpc_id = aws_vpc.vpc.id
  tags   = { Name = "${local.name_sg_bastion}_${data.aws_availability_zones.available.names[count.index]}" }
}

resource "aws_security_group_rule" "bastion_inbound_to_ssh_from_internet" {
  count             = var.availability_zones
  type              = "ingress"
  description       = "inbound to ssh from the internet"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.source_cidr_block]
  security_group_id = aws_security_group.bastion[count.index].id
}

resource "aws_security_group_rule" "bastion_outbound_to_all" {
  count             = var.availability_zones
  type              = "egress"
  description       = "outbound to all"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.bastion[count.index].id
}
