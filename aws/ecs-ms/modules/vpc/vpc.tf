#========================== VPC =============================
# Declare the data source
data "aws_availability_zones" "available" {}

# Define a vpc
resource "aws_vpc" "tf_vpc" {
  cidr_block = "${var.network_cidr}"
  tags {
    Name = "${var.project_name}-vpc"
  }
}

# Internet gateway for the public subnet
resource "aws_internet_gateway" "tf_ig" {
  vpc_id = "${aws_vpc.tf_vpc.id}"
  tags {
    Name = "${var.project_name}-ig"
  }
}

# Public subnet 1
resource "aws_subnet" "tf_public_sn_01" {
  vpc_id = "${aws_vpc.tf_vpc.id}"
  cidr_block = "${var.public_01_cidr}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  tags {
    Name = "${var.project_name}-sn-01"
  }
}

# Public subnet 2
resource "aws_subnet" "tf_public_sn_02" {
  vpc_id = "${aws_vpc.tf_vpc.id}"
  cidr_block = "${var.public_02_cidr}"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
  tags {
    Name = "${var.project_name}-sn-02"
  }
}

# Routing table for public subnet 1
resource "aws_route_table" "tf_public_sn_rt_01" {
  vpc_id = "${aws_vpc.tf_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.tf_ig.id}"
  }
  tags {
    Name = "${var.project_name}-sn-rt-01"
  }
}

# Associate the routing table to public subnet 1
resource "aws_route_table_association" "tf_public_sn_rt_01_assn" {
  subnet_id = "${aws_subnet.tf_public_sn_01.id}"
  route_table_id = "${aws_route_table.tf_public_sn_rt_01.id}"
}

# Routing table for public subnet 2
resource "aws_route_table" "tf_public_sn_rt_02" {
  vpc_id = "${aws_vpc.tf_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.tf_ig.id}"
  }
  tags {
    Name = "${var.project_name}-sn-rt-02"
  }
}

# Associate the routing table to public subnet 2
resource "aws_route_table_association" "tf_public_sn_rt_02_assn" {
  subnet_id = "${aws_subnet.tf_public_sn_02.id}"
  route_table_id = "${aws_route_table.tf_public_sn_rt_02.id}"
}