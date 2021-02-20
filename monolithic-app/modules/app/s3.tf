resource "aws_s3_bucket" "webapp_bucket" {
  bucket = "${var.project_name}-${var.project_environment}-webapp-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = merge(
    var.resource_tags, map("Name", "${var.project_name}-${var.project_environment}-webapp-bucket")
  )
}

resource "aws_s3_bucket_public_access_block" "webapp_bucket_public_access_block" {
  bucket = aws_s3_bucket.webapp_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
