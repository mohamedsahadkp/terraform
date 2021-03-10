locals {
  module = lookup(var.envi, terraform.workspace)
}

module "network" {
  source  = "./modules/network"
  project = local.module.project
  network = local.module.network
}

module "api" {
  source  = "./modules/api"
  project = local.module.project
  api     = local.module.api
  vpc     = module.network
}

# module "database" {
#   source   = "./modules/rds"
#   project  = var.project
#   database = var.database
# }

# module "domain" {
#   source   = "./modules/rds"
#   project  = var.project
#   database = var.database
# }

# module "app" {
#   source  = "./modules/app"
#   project = var.project
#   app     = var.app
# }

# module "files" {
#   source  = "./modules/files"
#   project = var.project
#   files   = var.files
# }

