data "aws_iam_policy_document" "webapp_policy_document" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.webapp_bucket.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = ["${aws_cloudfront_origin_access_identity.webapp_cloudfront_origin_access_identity.iam_arn}"]
    }
  }
}

resource "aws_s3_bucket_policy" "tf_s3_bucket_polic_s3_webapps" {
  bucket = "${aws_s3_bucket.webapp_bucket.id}"
  policy = "${data.aws_iam_policy_document.webapp_policy_document.json}"
}
