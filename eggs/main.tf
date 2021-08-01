terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
  default_tags {
    tags = module.tags.all_the_tags
  }
}

module "tags" {
  source = "../modules/tags"
  additional_tags = {
    github_repo    = "koffee"
    tf_root_module = "eggs"
  }
}
