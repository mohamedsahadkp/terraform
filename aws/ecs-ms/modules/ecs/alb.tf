resource "aws_alb" "tf_alb" {
  name            = "${var.project_name}-${var.project_environment}-alb"
  subnets         = ["${var.public_subnet_1a}", "${var.public_subnet_1b}"]
  security_groups = ["${aws_security_group.tf_alb_sg.id}"]
}