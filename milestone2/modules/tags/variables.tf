variable "project" {
  type    = string
}

variable "created_using" {
  type    = string
  default = "terraform"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "additional_tags" {
  type    = map(string)
  default = {}
}
