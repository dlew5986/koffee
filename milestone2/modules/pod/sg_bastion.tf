resource "aws_security_group" "bastion" {
  name   = local.sg_name_bastion
  vpc_id = data.aws_vpc.vpc.id
  tags   = { Name = local.sg_name_bastion }
}

resource "aws_security_group_rule" "inbound_to_ssh_from_internet" {
  type              = "ingress"
  description       = "inbound to ssh from the internet"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.cidr_block_allowed_inbound_ssh]
  security_group_id = aws_security_group.bastion.id
}

resource "aws_security_group_rule" "outbound_to_all" {
  type              = "egress"
  description       = "outbound to all"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.bastion.id
}
