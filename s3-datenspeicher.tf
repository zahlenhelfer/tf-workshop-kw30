resource "aws_s3_bucket" "data-bucket" {
  bucket = var.s3_databucket_name
}

resource "aws_s3_bucket_acl" "s3-data-acl" {
  bucket = aws_s3_bucket.data-bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.data-bucket.id

  versioning_configuration {
    status = "Enabled"
  }

}
