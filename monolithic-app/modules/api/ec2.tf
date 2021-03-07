resource "aws_network_interface" "api_server_network_interface" {
  subnet_id       = var.vpc.subnet_one_id
  security_groups = [aws_security_group.api_server_security_group.id]
  count           = var.api.ec2.instance_count // Number of ec2 instance

  tags = merge(
    var.project.resource_tags, map("Name", "${var.project.name}-${var.project.environment}-api-server-network-interface-${count.index}")
  )
}

resource "aws_instance" "api_server" {
  count         = var.api.ec2.instance_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.api.ec2.instance_type
  key_name      = aws_key_pair.api_server_key.key_name

  // security_groups = ""
  // vpc_security_group_ids = ""

  network_interface {
    network_interface_id = aws_network_interface.api_server_network_interface[count.index].id
    device_index         = 0
  }

  root_block_device {
    volume_type           = var.api.ec2.ebs.volume_type
    volume_size           = var.api.ec2.ebs.volume_size
    delete_on_termination = var.api.ec2.ebs.delete_on_termination
  }
  //ebs_block_device {}

  tags = merge(
    var.project.resource_tags, map("Name", "${var.project.name}-${var.project.environment}-api-server-${count.index}")
  )

  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo apt-get install -y nginx",
  #     "sudo service nginx start",
  #   ]
  # }

  # provisioner "local-exec" {
  #   command = "echo ${aws_instance.api_server[count.index].private_ip}"
  # }

  # provisioner "remote-exec" {
  #   when = destory
  #   inline = [
  #     "sudo apt-get purge -y nginx nginx-common",
  #     "sudo apt-get autoremove",
  #   ]
  # }

  # connection {
  #   type        = "ssh"
  #   user        = "ubuntu"
  #   host        = self.public_ip
  #   private_key = file(var.api.ec2.private_key_file_path)
  # }
}
