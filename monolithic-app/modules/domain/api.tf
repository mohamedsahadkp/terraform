resource "cloudflare_record" "foobar" {
  zone_id = var.cloudflare_zone_id
  name    = "terraform"
  value   = "192.168.0.11"
  type    = "A"
  ttl     = 3600
}
