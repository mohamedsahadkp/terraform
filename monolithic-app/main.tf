# AWS
provider "aws" {
  region = var.aws_region
}

# Terraform State & Lock Information
terraform {
  backend "s3" {
    encrypt = true
  }
}
