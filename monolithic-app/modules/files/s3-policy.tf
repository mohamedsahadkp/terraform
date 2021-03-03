resource "aws_cloudfront_origin_access_identity" "cloudfront_access_identity" {
  comment = "${var.project.name}-${var.project.environment}-origin-access-identity-files"
}

data "aws_iam_policy_document" "policy_document" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.bucket.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.cloudfront_access_identity.iam_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.policy_document.json
}
