terraform {
  backend "s3" {
    bucket         = "mro-s3-terraform-backend"
    key            = "terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "mro-terraform-state-lock-dynamo"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.23.0"
    }
  }
  required_version = ">= 1.0"
}

