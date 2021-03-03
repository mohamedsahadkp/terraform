resource "aws_route53_record" "tf_route53_record" {
  zone_id = data.aws_route53_zone.tf_route53_zone.zone_id
  name    = "api.${var.domain_name}"
  type    = "A"

  alias {
    name                   = aws_alb.tf_alb.dns_name
    zone_id                = aws_alb.tf_alb.zone_id
    evaluate_target_health = true
  }
}

