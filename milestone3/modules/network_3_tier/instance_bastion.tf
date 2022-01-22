resource "aws_instance" "bastion" {
  count                       = var.availability_zones
  ami                         = data.aws_ami.ami.id
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key_pair.key_name
  subnet_id                   = aws_subnet.public[count.index].id
  vpc_security_group_ids      = [aws_security_group.bastion[count.index].id]

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }

  tags        = { Name = "${local.name_instance_bastion}_${data.aws_availability_zones.available.names[count.index]}" }
  volume_tags = { Name = "${local.name_instance_bastion}_${data.aws_availability_zones.available.names[count.index]}" }
}

resource "aws_ec2_tag" "eni_tags_bastion" {
  count       = var.availability_zones
  resource_id = aws_instance.bastion[count.index].primary_network_interface_id
  key         = "Name"
  value       = "${local.name_instance_bastion}_${data.aws_availability_zones.available.names[count.index]}"
}
