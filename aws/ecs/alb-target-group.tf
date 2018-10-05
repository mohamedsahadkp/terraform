resource "aws_alb_target_group" "tf_tg" {
    name                = "${var.project_name}-${var.project_env}-tg"
    port                = "80"
    protocol            = "HTTP"
    vpc_id              = "${aws_vpc.tf_vpc.id}"

    health_check {
        healthy_threshold   = "5"
        unhealthy_threshold = "2"
        interval            = "30"
        matcher             = "200"
        path                = "/"
        port                = "traffic-port"
        protocol            = "HTTP"
        timeout             = "5"
    }

    tags {
      Name = "${var.project_name}-${var.project_env}-tg"
    }
}

resource "aws_alb_listener" "tf_alb_listener" {
    load_balancer_arn = "${aws_alb.tf_alb.arn}"
    port              = "80"
    protocol          = "HTTP"

    default_action {
        target_group_arn = "${aws_alb_target_group.tf_tg.arn}"
        type             = "forward"
    }
}