resource "aws_security_group" "api_server_security_group" {
  name        = "${var.project.name}-${var.project.environment}-api-server-sg"
  description = "${var.project.name}-${var.project.environment}-api-server-sg"
  vpc_id      = var.vpc.id

  dynamic "ingress" {
    for_each = var.api.ec2.ports.in_bound_rules
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.project.resource_tags, map("Name", "${var.project.name}-${var.project.environment}-api-server-sg")
  )
}
