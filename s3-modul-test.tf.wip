module "website_s3_bucket" {
  source = "./modules/aws-s3-static-websitehosting"

  website-bucket-name = "mro-modul-test-42"
  enable-versioning   = false
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

}
