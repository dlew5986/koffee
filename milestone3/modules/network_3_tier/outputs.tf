output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "cidr_block_public" {
  value = local.cidr_block_public
}

output "cidr_block_app" {
  value = local.cidr_block_app
}

output "cidr_block_database" {
  value = local.cidr_block_database
}

output "azs" {
  value = data.aws_availability_zones.available
}
