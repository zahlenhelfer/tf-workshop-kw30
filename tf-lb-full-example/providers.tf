provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Environment = "Dev"
      Owner       = "Deployed by Terraform"
    }
  }

}
