resource "tls_private_key" "key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name   = local.name_key_pair
  public_key = tls_private_key.key_pair.public_key_openssh
}

resource "local_file" "private_key_in_pem_format" {
  sensitive_content = tls_private_key.key_pair.private_key_pem
  filename          = "${path.root}/${var.namespace}.private.pem"
  file_permission   = "0400"
}

resource "local_file" "public_key_in_pem_format" {
  sensitive_content = tls_private_key.key_pair.public_key_pem
  filename          = "${path.root}/${var.namespace}.public.pem"
  file_permission   = "0400"
}

resource "local_file" "public_key_in_openssh_format" {
  sensitive_content = tls_private_key.key_pair.public_key_openssh
  filename          = "${path.root}/${var.namespace}.public.openssh"
  file_permission   = "0400"
}
