resource "aws_security_group" "tf_alb_sg" {
  name        = "${var.project_name}-${var.project_env}-alb-sg"
  description = "Controls access to the ALB"
  vpc_id      = "${aws_vpc.tf_vpc.id}"

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
}