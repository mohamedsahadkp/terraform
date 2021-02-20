locals {
  default_page                = "index.html"
  origin_id                   = "${aws_s3_bucket.bucket.bucket_regional_domain_name}-origin-id-files"
  default_cache_behavior_path = ""
  ordered_cache_behavior_path = "/path0"
}

resource "aws_cloudfront_distribution" "cloudfront" {
  origin {
    domain_name = aws_s3_bucket.bucket.bucket_regional_domain_name
    // origin_path = ""
    origin_id = local.origin_id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.cloudfront_access_identity.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = local.default_page
  comment             = "${var.project_name}-${var.project_environment}-files"

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

    # Restrict Viewer Access (Use Signed URLs) 
    # Create CloudFront keys to access files
    trusted_signers = ["self"]
  }

  # Cache behavior with precedence 0
  # ordered_cache_behavior {
  #   path_pattern    = local.ordered_cache_behavior_path
  #   allowed_methods = ["GET", "HEAD"]
  #   cached_methods  = ["GET", "HEAD"]

  #   target_origin_id = local.origin_id

  #   forwarded_values {
  #     # Add the headers required
  #     headers      = ["CloudFront-Viewer-Country", "Access-Control-Expose-Headers"]
  #     query_string = false
  #     cookies {
  #       forward = "none"
  #     }
  #   }
  #   min_ttl                = 0
  #   max_ttl                = 86400
  #   default_ttl            = 3600
  #   viewer_protocol_policy = "allow-all"

  #   compress = true

  #   //Lambda function information
  #   lambda_function_association {
  #     event_type   = "origin-response"
  #     include_body = false
  #     lambda_arn   = "lambda_function_arn"
  #   }
  # }

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
    var.resource_tags, map("Name", "${var.project_name}-${var.project_environment}-files")
  )
}

