output "webapp_s3_bucket" {
  value = "${aws_s3_bucket.webapp_bucket.bucket_regional_domain_name}"
}

output "webapp_cloudfront_domain_name" {
  value = "${aws_cloudfront_distribution.webapp_cloudfront_distribution.domain_name}"
}
