resource "aws_security_group" "tf_ecs_service_ms2_sg" {
  name        = "${var.project_name}-${var.microservices_name}-${var.project_environment}-ecs-service-sg"
  vpc_id      = "${var.vpc_id}"

  ingress {
    protocol    = "tcp"
    from_port   = "${var.container_port}"
    to_port     = "${var.container_port}"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}