resource "aws_instance" "api_server" {
  count         = var.api.ec2.instance_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.api.ec2.instance_type
  key_name      = aws_key_pair.application_server_key.key_name

  vpc_security_group_ids = [aws_security_group.api_server_security_group.id]

  root_block_device {
    volume_type           = var.api.ec2.ebs.volume_type
    volume_size           = var.api.ec2.ebs.volume_size
    delete_on_termination = var.api.ec2.ebs.delete_on_termination
  }
  //ebs_block_device {}

  tags = merge(
    var.project.resource_tags, map("Name", "${var.project.name}-${var.project.environment}-api-server-${count.index}")
  )
}
