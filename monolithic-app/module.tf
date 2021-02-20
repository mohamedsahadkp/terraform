module "network" {
  source  = "./modules/network"
  project = var.project
  network = var.network
}

module "api" {
  source  = "./modules/api"
  project = var.project
  api     = var.api
}

# module "rds" {
#   source              = "./modules/rds"
#   project_name        = var.project_name
#   project_environment = var.project_environment
#   vpc                 = var.vpc
#   database            = var.rds
#   resource_tags       = var.resource_tags
# }

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

