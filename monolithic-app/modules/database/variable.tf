variable "project_name" {
  description = "Project Name"
}
variable "project_environment" {
  description = "Project Environment"
}
variable "database" {
  description = "RDS Config Map"
}
variable "resource_tags" {
  description = "Resource Tags"
}

// VPC Config
variable "vpc" {
  description = "VPC Config Map"
}

variable "ec2_private_ips" {
  description = "EC2 Private IPs List"
}

