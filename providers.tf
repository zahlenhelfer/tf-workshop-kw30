provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Workspace   = terraform.workspace
      Environment = "Dev"
      Owner       = "Deployed by Terraform"
    }
  }

}
