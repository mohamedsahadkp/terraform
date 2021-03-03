resource "aws_route53_record" "tf_route53_record" {
  zone_id = data.aws_route53_zone.tf_route53_zone.zone_id
  name    = "app.${var.domain_name}"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.tf_aws_cloudfront_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.tf_aws_cloudfront_distribution.hosted_zone_id
    evaluate_target_health = true
  }
}


