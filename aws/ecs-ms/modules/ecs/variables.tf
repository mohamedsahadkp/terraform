########################### App Config ################################
variable "project_name" {
  description = "project-name"
}

variable "project_environment" {
  description = "development"
}

########################### VPC Config ################################
variable "vpc_id" {
  description = "vpc id"
}

variable "vpc_subnet_1a" {
  description = "vpc public subnet 1a"
}

variable "vpc_subnet_1b" {
  description = "vpc public subnet 1b"
}