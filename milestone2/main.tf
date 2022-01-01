provider "aws" {
  region = local.aws_region

  default_tags {
    tags = module.tags.all_the_tags
  }

}

module "tags" {
  source = "./modules/tags"
  additional_tags = {
    github_repo = local.namespace
  }
}
