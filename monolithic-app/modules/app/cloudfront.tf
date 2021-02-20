locals {
  default_page = "index.html"
  origin_id    = "${aws_s3_bucket.webapp_bucket.bucket_regional_domain_name}-origin-id-app"
}

resource "aws_cloudfront_origin_access_identity" "cloudfront_access_identity" {
  comment = "${var.project_name}-${var.project_environment}-origin-access-identity-app"
}

resource "aws_cloudfront_distribution" "cloudfront" {
  origin {
    domain_name = "${aws_s3_bucket.webapp_bucket.bucket_regional_domain_name}"
    // origin_path = ""
    origin_id = local.origin_id
    s3_origin_config {
      origin_access_identity = "${aws_cloudfront_origin_access_identity.webapp_cloudfront_origin_access_identity.cloudfront_access_identity_path}"
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = local.default_page
  comment             = "${var.project_name}-${var.project_environment}-webapp"

  default_cache_behavior {
    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]

    target_origin_id = local.origin_id

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
    min_ttl                = 0
    max_ttl                = 86400
    default_ttl            = 3600
    viewer_protocol_policy = "redirect-to-https"

    compress = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
    minimum_protocol_version       = "TLSv1"
  }

  custom_error_response {
    error_code         = 403
    response_code      = 200
    response_page_path = "/${local.default_page}"
  }

  custom_error_response {
    error_code         = 404
    response_code      = 200
    response_page_path = "/${local.default_page}"
  }

  tags = merge(
    var.resource_tags, map("Name", "${var.project_name}-${var.project_environment}-app")
  )
}

