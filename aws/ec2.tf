# 
# Mohamed Sahad K P
#
# EC2 Instance (API Server)
#

# Provider
provider "aws" {
  region = "ca-central-1"
}

# Variable
variable "project_name" {
   default     = "salesboost"
}

variable "project_env" {
   default     = "dev"
}


# Data
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


# Resource
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "${var.project_name}-${var.project_env}-key"
  public_key = "${tls_private_key.ssh_key.public_key_openssh}"
}

resource "aws_security_group" "sg" {
  name        = "${var.project_name}-${var.project_env}-sg"
  description = "Allow all inbound traffic"

  ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
		from_port = 443
		to_port = 443
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

  egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

  tags {
    Name = "${var.project_name}-${var.project_env}-sg",
    Project = "${var.project_name}"
  }
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = "${aws_security_group.sg.id}"
  network_interface_id = "${aws_instance.ec2.primary_network_interface_id}"
}

resource "aws_instance" "ec2" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro",
  key_name      = "${aws_key_pair.kp.id}"
  associate_public_ip_address = true,
  user_data = "${file("install.sh")}"

  tags {
    Name = "${var.project_name}-${var.project_env}"
    Project = "${var.project_name}"
  }

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "30"
    delete_on_termination = "true"
  }
}








