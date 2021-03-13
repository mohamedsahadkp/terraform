resource "aws_key_pair" "api_server_key" {
  key_name   = "${var.project.name}-${var.project.environment}-api-server-key"
  public_key = file(var.api.ec2.public_key_file_path)
}