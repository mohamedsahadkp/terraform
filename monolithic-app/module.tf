module "network" {
  source  = "./modules/network"
  project = var.project
  network = var.network
}

# module "api" {
#   source  = "./modules/api"
#   project = var.project
#   api     = var.api
# }

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

