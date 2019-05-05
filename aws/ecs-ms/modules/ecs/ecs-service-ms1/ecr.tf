resource "aws_ecr_repository" "tf_ecr_repository" {
  name = "${var.project_name}-${var.project_ms_name}"
}