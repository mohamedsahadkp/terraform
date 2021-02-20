# AWS
provider "aws" {
  region = var.aws_region
}

# Terraform state store (AWS S3)
terraform {
  backend "s3" {
    encrypt = true
  }
}
