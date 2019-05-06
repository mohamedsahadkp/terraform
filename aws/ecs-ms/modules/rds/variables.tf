########################### App Config ################################
variable "project_name" {
  description = "project_name"
}

variable "project_environment" {
  description = "development"
}

########################### VPC Config ################################
variable "vpc_id" {
  description = "vpc id"
}

variable "public_subnet_1a" {
  description = "vpc public subnet 1a"
}

variable "public_subnet_1b" {
  description = "vpc public subnet 1b"
}

########################### RDS Config ################################
variable "rds_port" {
  description = "rds_port"
  default = 5432
}

variable "rds_username" {
  description = "rds_username"
  default = "admin"
}

variable "rds_password" {
  description = "rds_password"
  default = "admin12345"
}

variable "rds_storage" {
  description = "rds_storage"
  default = 5
}