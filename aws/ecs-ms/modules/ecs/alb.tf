resource "aws_alb" "tf_alb" {
  name            = "${var.project_name}-${var.project_environment}-alb"
  subnets         = ["${var.vpc_subnet_1a}", "${var.vpc_subnet_1a}"]
  security_groups = ["${aws_security_group.tf_alb_sg.id}"]
}