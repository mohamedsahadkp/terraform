# Github
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.5.0"
    }
  }
}

# AWS
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.30.0"
    }
  }
}


