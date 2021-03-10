terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.5.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "3.30.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "2.18.0"
    }
  }
  required_version = ">= 0.12"
}

# AWS
provider "aws" {
  region = local.environment.project.aws_region
}

# Github
provider "github" {
}

# Cloudflare
provider "cloudflare" {
}
