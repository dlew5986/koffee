data "aws_availability_zone" "a" {
  filter {
    name   = "zone-name"
    values = ["*a"]
  }
}

data "aws_availability_zone" "b" {
  filter {
    name   = "zone-name"
    values = ["*b"]
  }
}

data "aws_availability_zone" "c" {
  filter {
    name   = "zone-name"
    values = ["*c"]
  }
}
