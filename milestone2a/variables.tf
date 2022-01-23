variable "aws_region" {
  type    = string
  default = "us-east-2"
}

variable "namespace" {
  description = "the project name"
  type        = string
  default     = "koffee"
}

variable "vpc_cidr_block" {
  description = "the CIDR block for the vpc"
  type        = string
  default     = "172.16.0.0/16"
}

variable "availability_zones" {
  description = "the number of availability zones"
  type        = number
  default     = 3
}
