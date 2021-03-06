# AWS VPC Subnet
resource "aws_subnet" "subnet_public_two" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.network.vpc.subnet_two.cidr
  availability_zone       = data.aws_availability_zones.availability_zones.names[0]
  map_public_ip_on_launch = var.network.vpc.subnet_two.map_public_ip_on_launch

  tags = merge(
    var.project.resource_tags, map(local.name, "${var.project.name}-${var.project.environment}-subnet-public-one")
  )
}

# AWS VPC Route Table
resource "aws_route_table" "route_table_public_two" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = local.public_route_cidr_block
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = merge(
    var.project.resource_tags, map(local.name, "${var.project.name}-${var.project.environment}-route-table-public-one")
  )
}

# AWS VPC Route Table Association
resource "aws_route_table_association" "route_table_association_public_two" {
  subnet_id      = aws_subnet.subnet_public_two.id
  route_table_id = aws_route_table.route_table_public_two.id
}
