resource "aws_key_pair" "api_server_key" {
  key_name   = "${var.project.name}-${var.project.environment}-api-server-key"
  public_key = var.api.ec2.key
}
