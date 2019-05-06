resource "aws_s3_bucket" "aws_s3_bucket" {
  bucket = "${var.project_name}-${var.project_environment}-bucket"
  acl    = "private"

  tags {
    Project = "${var.project_name}"
    Environment = "${var.project_environment}"
  }   
}

resource "aws_s3_bucket" "tf_s3_website" {
  bucket = "${var.project_name}-${var.project_environment}-website"
  acl    = "public-read"
  policy = <<EOF
  {
    "Version": "2008-10-17",
    "Statement": [
        {
        "Sid": "PublicReadForGetBucketObjects",
        "Effect": "Allow",
        "Principal": {
            "AWS": "*"
        },
        "Action": "s3:GetObject",
        "Resource": "arn:aws:s3:::${var.project_name}-${var.project_environment}-website/*"
        }
    ]
  }
  EOF

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  tags {
    Project = "${var.project_name}"
    Environment = "${var.project_environment}"
  }  
}