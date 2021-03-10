locals {
  environment = lookup(var.environment, terraform.workspace)
}

module "network" {
  source  = "./src/network"
  project = local.environment.project
  network = local.environment.network
}

# module "api" {
#   source  = "./src/api"
#   project = local.environment.project
#   api     = local.environment.api
#   vpc     = module.network
# }

# module "database" {
#   source   = "./src/rds"
#   project  = var.project
#   database = var.database
# }

# module "domain" {
#   source   = "./src/rds"
#   project  = var.project
#   database = var.database
# }

# module "app" {
#   source  = "./src/app"
#   project = var.project
#   app     = var.app
# }

# module "files" {
#   source  = "./src/files"
#   project = var.project
#   files   = var.files
# }

