resource "aws_alb" "tf_alb" {
    name                = "${var.project_name}-${var.project_env}-alb"
    security_groups     = ["${aws_security_group.test_public_sg.id}"]
    subnets             = ["${aws_subnet.tf_public_sn_01.id}", "${aws_subnet.tf_public_sn_02.id}"]

    tags {
      Name = "${var.project_name}-${var.project_env}-alb"
    }
}