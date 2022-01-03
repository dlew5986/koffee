resource "aws_instance" "app" {
  ami                         = data.aws_ami.ami.id
  associate_public_ip_address = false
  instance_type               = "t2.micro"
  key_name                    = data.aws_key_pair.key_pair.key_name
  subnet_id                   = aws_subnet.private_app.id
  vpc_security_group_ids      = [aws_security_group.app.id]

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }

  tags        = { Name = local.instance_name_app }
  volume_tags = { Name = local.instance_name_app }

}

resource "aws_ec2_tag" "eni_tags_app" {
  resource_id = aws_instance.app.primary_network_interface_id
  for_each    = { Name = local.instance_name_app }
  key         = each.key
  value       = each.value
}
