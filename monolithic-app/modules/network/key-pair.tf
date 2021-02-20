resource "aws_key_pair" "application_server_key" {
  key_name   = "${var.project_name}-${var.project_environment}-application-server-key"
  public_key = var.ec2.key
}
