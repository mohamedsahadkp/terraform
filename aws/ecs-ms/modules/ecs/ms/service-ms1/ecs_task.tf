data "template_file" "tf_ecs_td_container_definitions" {
  template = "${file("${path.module}/ecs_task.json")}"

  vars {
    image               = "${aws_ecr_repository.tf_ecr_repository.repository_url}:${var.project_env}"
    container_name      = "${var.project_name}-${var.project_ms_name}-${var.project_env}-container"
    container_port      = "${var.container_port}"
    log_group           = "${var.project_name}-${var.project_ms_name}-${var.project_env}-log"
    task_cpu            = "${var.task_cpu}"
    task_memory         = "${var.task_memory}"
  }
}

resource "aws_ecs_task_definition" "tf_ecs_task_definition" {
  family                   = "${var.project_name}-${var.project_ms_name}-${var.project_env}-family"
  container_definitions    = "${data.template_file.tf_ecs_td_container_definitions.rendered}"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "${var.task_cpu}"
  memory                   = "${var.task_memory}"

  execution_role_arn = "${var.ecs_task_role_arn}"
  task_role_arn      = "${var.ecs_task_role_arn}"
}