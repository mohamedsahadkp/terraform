# module "ec2" {
#   source              = "./modules/ec2"
#   project_name        = var.project_name
#   project_environment = var.project_environment
#   vpc                 = var.vpc
#   ec2                 = var.api.ec2
#   resource_tags       = var.resource_tags
# }

# module "rds" {
#   source              = "./modules/rds"
#   project_name        = var.project_name
#   project_environment = var.project_environment
#   vpc                 = var.vpc
#   database            = var.rds
#   resource_tags       = var.resource_tags
# }

module "network" {
  source  = "./modules/network"
  project = var.project
  network = var.network
}

module "app" {
  source  = "./modules/app"
  project = var.project
  app     = var.app
}

module "files" {
  source  = "./modules/files"
  project = var.project
  files   = var.files
}

