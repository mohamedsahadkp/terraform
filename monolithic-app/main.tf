# AWS
provider "aws" {
  region = var.project.aws_region
}

# Github
provider "github" {
}

# Cloudflare
provider "cloudflare" {
}

# Terraform State & Lock Information
terraform {
  backend "s3" {
    encrypt = true
  }
}

