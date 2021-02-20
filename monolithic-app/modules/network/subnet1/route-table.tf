data "aws_availability_zones" "tf_availability_zones" {
  state = "available"
}

locals {
  common_tags             = var.resource_tags
  public_route_cidr_block = "0.0.0.0/0"
  name                    = "Name"
}

resource "aws_vpc" "tf_vpc" {
  enable_dns_support   = true
  enable_dns_hostnames = true
  cidr_block           = var.vpc.cidr
  tags = merge(
    local.common_tags, map(local.name, "${var.project_name}-${var.project_environment}-vpc")
  )
}

resource "aws_internet_gateway" "tf_internet_gateway" {
  vpc_id = aws_vpc.tf_vpc.id
  tags = merge(
    local.common_tags, map(local.name, "${var.project_name}-${var.project_environment}-igw")
  )
}

// VPC Subnet
resource "aws_subnet" "tf_subnet_public_one" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.vpc.subnet_one
  availability_zone = data.aws_availability_zones.tf_availability_zones.names[0]
  tags = merge(
    local.common_tags, map(local.name, "${var.project_name}-${var.project_environment}-subnet-public-one")
  )
}
resource "aws_subnet" "tf_subnet_public_two" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.vpc.subnet_two
  availability_zone = data.aws_availability_zones.tf_availability_zones.names[1]
  tags = merge(
    local.common_tags, map(local.name, "${var.project_name}-${var.project_environment}-subnet-public-two")
  )
}

// Route Table
resource "aws_route_table" "aws_route_table_public_one" {
  vpc_id = aws_vpc.tf_vpc.id
  route {
    cidr_block = local.public_route_cidr_block
    gateway_id = aws_internet_gateway.tf_internet_gateway.id
  }
  tags = merge(
    local.common_tags, map(local.name, "${var.project_name}-${var.project_environment}-route-table-public-one")
  )
}
resource "aws_route_table" "aws_route_table_public_two" {
  vpc_id = aws_vpc.tf_vpc.id

  route {
    gateway_id = aws_internet_gateway.tf_internet_gateway.id
    cidr_block = local.public_route_cidr_block
  }
  tags = merge(
    local.common_tags, map(local.name, "${var.project_name}-${var.project_environment}-route-table-public-two")
  )
}

// Route Table Association
resource "aws_route_table_association" "aws_route_table_association_public_one" {
  subnet_id      = aws_subnet.tf_subnet_public_one.id
  route_table_id = aws_route_table.aws_route_table_public_one.id
}
resource "aws_route_table_association" "aws_route_table_association_public_two" {
  subnet_id      = aws_subnet.tf_subnet_public_two.id
  route_table_id = aws_route_table.aws_route_table_public_two.id
}
