# //Database (RDS)
# output "rds_endpoint" {
#   value = module.rds.rds_endpoint
# }
# output "rds_username" {
#   value = module.rds.rds_username
# }
# output "rds_password" {
#   value = module.rds.rds_password
# }

# //EC2 
# output "ec2_public_dns1" {
#   value = module.ec2.ec2_public_dns_1
# }
# output "ec2_public_dns2" {
#   value = module.ec2.ec2_public_dns_2
# }

// App Module
output "app_s3_bucket" {
  value = module.app.s3_bucket
}
output "app_cloudfront_domain_name" {
  value = module.app.cloudfront_domain_name
}

// Files Module
output "files_s3_bucket" {
  value = module.files.s3_bucket
}
output "files_cloudfront_domain_name" {
  value = module.files.cloudfront_domain_name
}
