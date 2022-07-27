resource "aws_s3_bucket" "static_bucket" {
  bucket = var.static_bucket_name
}

resource "aws_s3_bucket_acl" "s3-website-acl" {
  bucket = aws_s3_bucket.static_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.static_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.static_bucket.id
  policy = templatefile("bucket_policy.tmpl", {
    s3_bucket_name = var.static_bucket_name
  })
}

resource "aws_s3_object" "index_object" {
  bucket       = aws_s3_bucket.static_bucket.bucket
  source       = "index.html"
  key          = "index.html"
  content_type = "text/html"
  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("index.html")

  depends_on = [
    aws_s3_bucket.static_bucket
  ]
}
