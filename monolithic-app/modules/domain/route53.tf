data "aws_route53_zone" "tf_route53_zone" {
  name = "${var.domain_name}"
}

resource "aws_route53_zone" "dev" {
  name = "dev.example.com"

  tags = {
    Environment = "dev"
  }
}
