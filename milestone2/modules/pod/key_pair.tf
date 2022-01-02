data "aws_key_pair" "key_pair" {
  filter {
    name   = "key-pair-id"
    values = [var.key_pair_id]
  }
}
