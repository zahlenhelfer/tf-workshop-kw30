provider "aws" {
  region = "eu-central-1"

  default_tags {
    tags = {
      Environment = "Dev"
      Owner       = "Deployed by Terraform"
    }
  }

}
