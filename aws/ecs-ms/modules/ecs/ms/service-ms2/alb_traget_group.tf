resource "aws_alb_target_group" "tf_alb_tg_ms2" {
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

resource "aws_lb_listener_rule" "tf_alb_listener_rule_ms2" {
  listener_arn = "${var.alb_arn}"
  priority     = 200

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.tf_alb_tg_ms2.arn}"
  }
   condition {
    field  = "path-pattern"
    values = ["/ms2/*"]
  }
}