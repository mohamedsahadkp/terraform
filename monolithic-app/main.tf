# AWS
provider "aws" {
  region = var.project.aws_region
}

# Terraform State & Lock Information
terraform {
  backend "s3" {
    encrypt = true
  }
}
