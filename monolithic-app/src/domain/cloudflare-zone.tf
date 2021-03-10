data "cloudflare_zones" "example" {
  filter {
    name = "example.com"
  }
}

resource "cloudflare_zone" "example" {
  zone = "example.com"
}
