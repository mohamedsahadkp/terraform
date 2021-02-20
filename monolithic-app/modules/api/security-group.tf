resource "aws_security_group" "api_server_security_group" {
  name        = "${var.project_name}-${var.project_environment}-api-server-sg"
  description = "${var.project_name}-${var.project_environment}-api-server-sg"
  vpc_id      = var.vpc

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.resource_tags, map("Name", "${var.project_name}-${var.project_environment}-api-server-sg")
  )
}
