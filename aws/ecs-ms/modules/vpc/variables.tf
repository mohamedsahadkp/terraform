########################### App Config ################################
variable "project_name" {
  description = "project-name"
}

variable "project_environment" {
  description = "development"
}

########################### VPC Config ################################
variable "availability_zone_1a" {
  description = "availability_zone_1a"
  default = "us-east-1a"
}

variable "availability_zone_1b" {
  description = "availability_zone_1b"
  default = "us-east-1c"
}

variable "network_cidr" {
  description = "IP addressing for Network"
  default = "10.0.0.0/16"
}

variable "public_01_cidr" {
  description = "Public 0.0 CIDR for externally accessible subnet"
  default = "10.0.0.0/24"
}

variable "public_02_cidr" {
  description = "Public 0.0 CIDR for externally accessible subnet"
  default = "10.0.1.0/24"
}