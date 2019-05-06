output "alb-endpoint" {
  value = "${module.ecs.alb_dns_name}"
}

output "rds-endpoint" {
  value = "${module.rds.db_instance_address}"
}

output "static-website-endpoint" {
  value = "${module.s3.website_bucket}"
}

