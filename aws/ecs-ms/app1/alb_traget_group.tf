resource "aws_alb_target_group" "tf_alb_tg" {
  name        = "${var.project_name}-${var.project_env}-${var.project_ms_name}-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.tf_vpc.id}"
  target_type = "ip"

  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = "${var.health_check_path}"
    unhealthy_threshold = "2"
  }
}

resource "aws_alb_listener" "tf_alb_listener" {
  load_balancer_arn = "${aws_alb.tf_alb.id}"
  port              = "3000"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.tf_alb_tg.id}"
    type             = "forward"
  }
}