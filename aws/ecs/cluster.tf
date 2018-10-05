resource "aws_ecs_cluster" "tf_ecs_cluster" {
    name = "${var.project_name}_${var.project_env}_ecs"
}