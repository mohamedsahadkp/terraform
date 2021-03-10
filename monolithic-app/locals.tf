# locals {
#   envi = {
#     dev = {
#       project  = var.develop.project
#       api      = var.develop.api
#       database = var.develop.database
#       network  = var.develop.network
#       app      = var.develop.app
#       files    = var.develop.files
#       domain   = var.develop.domain
#     }
#     qa = {
#       project  = var.qa.project
#       api      = var.qa.api
#       database = var.qa.database
#       network  = var.qa.network
#       app      = var.qa.app
#       files    = var.qa.files
#       domain   = var.qa.domain
#     }
#     uat = {
#       project  = var.uat.project
#       api      = var.uat.api
#       database = var.uat.database
#       network  = var.uat.network
#       app      = var.uat.app
#       files    = var.uat.files
#       domain   = var.uat.domain
#     }
#   }

#   // environmentvars = "${contains(keys(local.env), terraform.workspace) ? terraform.workspace : "default"
# }
