output "object_bucket" {
  value = "${aws_s3_bucket.aws_s3_bucket.id}"
}

output "website_bucket" {
  value = "${aws_s3_bucket.tf_public_sn_01.id}"
}