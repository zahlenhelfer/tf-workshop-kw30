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

resource "aws_s3_object" "video_upload_object" {
  bucket = var.s3_databucket_name
  source = "video.mp4"
  key    = "video.mp4"
  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("video.mp4")

  depends_on = [
    aws_s3_bucket.data-bucket,
  ]
}
