resource "aws_s3_bucket" "bucket" {
  bucket = "${var.project_name}-${var.project_environment}-app"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = merge(
    var.resource_tags, map("Name", "${var.project_name}-${var.project_environment}-app")
  )
}

resource "aws_s3_bucket_public_access_block" "bucket_public_access_block" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
