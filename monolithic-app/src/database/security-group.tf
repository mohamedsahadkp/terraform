resource "aws_security_group" "rds_security_group" {
  name   = "${var.project.name}-${var.project.environment}-rds-sg"
  vpc_id = var.vpc

  dynamic "ingress" {
    for_each = var.database.rds.ports.in_bound_rules
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }


  tags = merge(
    var.project.resource_tags, map("Name", "${var.project.name}-${var.project.environment}-rds-sg")
  )
}
