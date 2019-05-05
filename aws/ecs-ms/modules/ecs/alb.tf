resource "aws_alb" "tf_alb" {
  name            = "${var.project_name}-${var.project_env}-alb"
  subnets         = ["${aws_subnet.tf_public_sn_01.id}", "${aws_subnet.tf_public_sn_02.id}"]
  security_groups = ["${aws_security_group.tf_alb_sg.id}"]
}