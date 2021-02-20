variable "project_name" {
  description = "Project Name"
}
variable "project_environment" {
  description = "Project Environment"
}
variable "aws_region" {
  description = "AWS Region"
}

// AWS Resource Tags
variable "resource_tags" {
  description = "Resource Tags Map"
}

# API
variable "api_config" {
  description = "ec2 Config Map"
}
# Database
variable "database_config" {
  description = "RDS Config Map"
}
# Network
variable "network_config" {
  decription = "Network Config Map"
}
# WebApp
variable "app_config" {
  description = "WebApp Config Map"
}
# Files
variable "files_config" {
  description = "Files Config Map"
}
