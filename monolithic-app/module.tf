# module "ec2" {
#   source              = "./modules/ec2"
#   project_name        = var.project_name
#   project_environment = var.project_environment
#   vpc                 = var.vpc
#   ec2                 = var.ec2_config
#   resource_tags       = var.resource_tags
# }

# module "rds" {
#   source              = "./modules/rds"
#   project_name        = var.project_name
#   project_environment = var.project_environment
#   vpc                 = var.vpc
#   database            = var.rds_config
#   resource_tags       = var.resource_tags
# }

module "app" {
  source              = "./modules/app"
  project_name        = var.project_name
  project_environment = var.project_environment
  resource_tags       = var.resource_tags
  app_config          = var.app_config
}



