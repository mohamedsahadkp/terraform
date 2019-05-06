resource "aws_alb_target_group" "tf_alb_tg" {
  name        = "${var.project_name}-${var.microservices_name}-${var.project_environment}-tg"
  port        = "${var.container_port}"
  protocol    = "HTTP"
  vpc_id      = "${var.vpc_id}"
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
  load_balancer_arn = "${var.alb_arn}"
  port              = "${var.alb_port}"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.tf_alb_tg.arn}"
    type             = "forward"
  }
}