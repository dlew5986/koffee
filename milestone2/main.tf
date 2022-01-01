provider "aws" {
  region = "us-east-2"

  default_tags {
    tags = module.tags.all_the_tags
  }

}

module "tags" {
  source = "../modules/tags"
  additional_tags = {
    github_repo = "koffee"
  }
}
