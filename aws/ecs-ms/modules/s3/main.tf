data "template_file" "tf_s3_public_policy" {
  template = "${file("${path.module}/public-read.json")}"

  vars {
    tf_s3_bucket_website = "${var.project_name}-${var.project_environment}-website"
  }
}

resource "aws_s3_bucket" "tf_s3_bucket_files" {
  bucket = "${var.project_name}-${var.project_environment}-files"
  acl    = "private"

  tags {
    Project = "${var.project_name}"
    Environment = "${var.project_environment}"
  }   
}

resource "aws_s3_bucket" "tf_s3_bucket_website" {
  bucket = "${var.project_name}-${var.project_environment}-website"
  acl    = "public-read"
  policy = "${data.template_file.tf_s3_public_policy.rendered}"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  tags {
    Project = "${var.project_name}"
    Environment = "${var.project_environment}"
  }  
}