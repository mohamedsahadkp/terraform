data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.api.ec2.ami.image]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = [var.api.ec2.ami.owner] # Canonical
}
