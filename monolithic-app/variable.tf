# Project General Info
variable "project" {
  description = "Project Config Maps"
}

# variable "project_environment" {
#   description = "Project Environment"
# }
# variable "aws_region" {
#   description = "AWS Region"
# }

# // AWS Resource Tags
# variable "resource_tags" {
#   description = "Resource Tags Map"
# }

# API
variable "api" {
  description = "ec2 Config Map"
}
# Database
variable "database" {
  description = "RDS Config Map"
}
# Network
variable "network" {
  description = "Network Config Map"
}
# WebApp
variable "app" {
  description = "WebApp Config Map"
}
# Files
variable "files" {
  description = "Files Config Map"
}
