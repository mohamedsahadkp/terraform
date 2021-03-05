variable "alb_security_group_list" {
  type    = list
  default = [443, 80]
}

resource "aws_security_group" "alb_security_group" {
  name        = "${var.project.name}-${var.project.environment}-alb-sg"
  description = "${var.project.name}-${var.project.environment}-alb-sg"
  vpc_id      = var.vpc

  dynamic "ingress" {
    for_each = var.alb_security_group_list
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # ingress {
  #   from_port   = 80
  #   to_port     = 80
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.project.resource_tags, map("Name", "${var.project.name}-${var.project.environment}-alb-sg")
  )
}
