terraform {
  required_providers {
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
  version = "3.30.0"
  region  = local.environment.project.aws_region.default
}

# provider "aws" {
#   version = "3.30.0"
#   alias  = "virginia"
#   region = local.environment.project.aws_region.virginia.name
#   profile = ""

#   assume_role {
#     role_arn     = "arn:aws:iam::ACCOUNT_ID:role/ROLE_NAME"
#     session_name = "SESSION_NAME"
#     external_id  = "EXTERNAL_ID"
#   }
# }

# Cloudflare
provider "cloudflare" {
}
