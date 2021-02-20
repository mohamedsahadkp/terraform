resource "aws_security_group" "db_security_group" {
  name   = "${var.project_name}-${var.project_environment}-rds-sg"
  vpc_id = var.vpc

  ingress {
    from_port   = var.database.port
    to_port     = var.database.port
    protocol    = "TCP"
    cidr_blocks = ["${var.ec2_private_ips[0]}/32", "${var.ec2_private_ips[1]}/32"]
  }

  tags = merge(
    var.resource_tags, map("Name", "${var.project_name}-${var.project_environment}-rds-sg")
  )
}
