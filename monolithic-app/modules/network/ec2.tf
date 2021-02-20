resource "aws_instance" "application_server" {
  count         = var.instance_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ec2.instance_type
  key_name      = aws_key_pair.application_server_key.key_name

  vpc_security_group_ids = [aws_security_group.application_server_security_group.id]

  root_block_device {
    volume_type           = var.ec2.ebs.volume_type
    volume_size           = var.ec2.ebs.volume_size
    delete_on_termination = var.ec2.ebs.delete_on_termination
  }
  //ebs_block_device {}

  tags = merge(
    var.resource_tags, map("Name", "${var.project_name}-${var.project_environment}-application-server-${count.index}")
  )
}
