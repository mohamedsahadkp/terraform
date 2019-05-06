output "files_bucket" {
  value = "${aws_s3_bucket.tf_s3_bucket_files.id}"
}

output "website_bucket" {
  value = "${aws_s3_bucket.tf_s3_bucket_website.id}"
}