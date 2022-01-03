resource "aws_security_group" "app" {
  name   = local.sg_name_app
  vpc_id = data.aws_vpc.vpc.id
  tags   = { Name = local.sg_name_app }
}

resource "aws_security_group_rule" "app_inbound_to_icmp_echo_from_bastion" {
  type                     = "ingress"
  description              = "inbound to icmp v4 echo from the bastion"
  from_port                = 8 # icmp type when protocol is "icmp"
  to_port                  = 0 # icmp code when protocol is "icmp"
  protocol                 = "icmp"
  source_security_group_id = aws_security_group.bastion.id
  security_group_id        = aws_security_group.app.id
}

resource "aws_security_group_rule" "app_inbound_to_ssh_from_bastion" {
  type                     = "ingress"
  description              = "inbound to ssh from the bastion"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.bastion.id
  security_group_id        = aws_security_group.app.id
}

resource "aws_security_group_rule" "app_outbound_to_all" {
  type              = "egress"
  description       = "outbound to all"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.app.id
}
