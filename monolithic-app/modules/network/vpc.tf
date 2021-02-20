data "aws_availability_zones" "tf_availability_zones" {
  state = "available"
}

locals {
  public_route_cidr_block = "0.0.0.0/0"
  name                    = "Name"
}

resource "aws_vpc" "vpc" {
  enable_dns_support   = true
  enable_dns_hostnames = true
  cidr_block           = var.network.vpc.cidr
  tags = merge(
    var.project.resource_tags, map(local.name, "${var.project.name}-${var.project.environment}-vpc")
  )
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    var.project.resource_tags, map(local.name, "${var.project.name}-${var.project.environment}-igw")
  )
}
