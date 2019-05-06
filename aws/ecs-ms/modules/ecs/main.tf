resource "aws_ecs_cluster" "tf_ecs_cluster" {
  name = "${var.project_name}-${var.project_environment}"

  tags {
    Project = "${var.project_name}"
    Environment = "${var.project_environment}"
  }
}

resource "aws_security_group" "tf_alb_sg" {
  name        = "${var.project_name}-${var.project_environment}-alb-sg"
  description = "Controls access to the ALB"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Project = "${var.project_name}"
    Environment = "${var.project_environment}"
  }
}

resource "aws_alb" "tf_alb" {
  name            = "${var.project_name}-${var.project_environment}-alb"
  subnets         = ["${var.public_subnet_1a}", "${var.public_subnet_1b}"]
  security_groups = ["${aws_security_group.tf_alb_sg.id}"]
}

resource "aws_alb_target_group" "tf_alb_tg_default" {
  name        = "${var.project_name}-${var.project_environment}-tg"
  port        =  3001
  protocol    = "HTTP"
  vpc_id      = "${var.vpc_id}"
  target_type = "ip"

  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = "/"
    unhealthy_threshold = "2"
  }
}

resource "aws_alb_listener" "tf_alb_listener" {
  load_balancer_arn = "${aws_alb.tf_alb.arn}"
  port              = "${var.alb_port}"
  default_action {
    target_group_arn = "${aws_alb_target_group.tf_alb_tg_default.arn}"
    type             = "forward"
  }
}

# resource "aws_alb_listener" "main" {
#   count = "${var.enable_lb ? 1 : 0 }"

#   load_balancer_arn = "${aws_alb.main.id}"
#   port              = "${lookup(var.lb_listener, "port")}"
#   protocol          = "${lookup(var.lb_listener, "protocol", "HTTP")}"
#   certificate_arn   = "${lookup(var.lb_listener, "certificate_arn", "")}"
#   ssl_policy        = "${lookup(var.lb_listener, "certificate_arn", "") == "" ? "" : lookup(var.lb_listener, "ssl_policy", "ELBSecurityPolicy-TLS-1-1-2017-01")}"

#   default_action {
#     target_group_arn = "${aws_alb_target_group.main.id}"
#     type             = "forward"
#   }
# }