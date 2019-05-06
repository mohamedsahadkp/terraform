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

resource "aws_alb_listener" "tf_alb_listener" {
  load_balancer_arn = "${aws_alb.tf_alb.arn}"
  port              = "${var.alb_port}"
}
