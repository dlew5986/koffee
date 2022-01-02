resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.ami.id
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  key_name                    = data.aws_key_pair.key_pair.key_name
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.bastion.id]

  #iam_instance_profile        = ""
  #user_data                   = ""

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }

  tags        = { Name = local.instance_name_bastion }
  volume_tags = { Name = local.instance_name_bastion }

}

resource "aws_ec2_tag" "eni_tags" {
  resource_id = aws_instance.bastion.primary_network_interface_id
  for_each    = { Name = local.instance_name_bastion }
  key         = each.key
  value       = each.value
}
