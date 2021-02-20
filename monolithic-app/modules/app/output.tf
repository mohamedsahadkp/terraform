output "s3_bucket" {
  value = "${aws_s3_bucket.bucket.bucket_regional_domain_name}"
}

output "cloudfront_domain_name" {
  value = "${aws_cloudfront_distribution.cloudfront.domain_name}"
}
