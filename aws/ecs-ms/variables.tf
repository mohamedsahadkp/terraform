########################### App Config ################################
variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "project_name" {
  description = "maphabit"
  default = "maphabit"
}

variable "project_env" {
  description = "development"
  default = "development"
}

########################### VPC Config ################################
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