resource "aws_instance" "app" {
  count                       = var.availability_zones
  ami                         = data.aws_ami.ami.id
  associate_public_ip_address = false
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key_pair.key_name
  subnet_id                   = aws_subnet.app[count.index].id
  vpc_security_group_ids      = [aws_security_group.app[count.index].id]

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }

  tags        = { Name = "${local.name_instance_app}_${data.aws_availability_zones.available.names[count.index]}" }
  volume_tags = { Name = "${local.name_instance_app}_${data.aws_availability_zones.available.names[count.index]}" }

}

resource "aws_ec2_tag" "eni_tags_app" {
  count       = var.availability_zones
  resource_id = aws_instance.app[count.index].primary_network_interface_id
  key         = "Name"
  value       = "${local.name_instance_app}_${data.aws_availability_zones.available.names[count.index]}"
}
