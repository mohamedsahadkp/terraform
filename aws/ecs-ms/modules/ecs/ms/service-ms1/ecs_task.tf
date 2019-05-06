data "template_file" "tf_ecs_task_template_ms1" {
  template = "${file("${path.module}/ecs_task.json")}"

  vars {
    image               = "${aws_ecr_repository.tf_ecr_repository.repository_url}:${var.project_environment}"
    container_name      = "${var.project_name}-${var.microservices_name}-${var.project_environment}-container"
    container_port      = "${var.container_port}"
    log_group           = "${aws_cloudwatch_log_group.tf_cloudwatch_log_group.name}"
    task_cpu            = "${var.task_cpu}"
    task_memory         = "${var.task_memory}"
  }
}

resource "aws_ecs_task_definition" "tf_ecs_task_definition_ms1" {
  family                   = "${var.project_name}-${var.microservices_name}-${var.project_environment}-family"
  container_definitions    = "${data.template_file.tf_ecs_task_template_ms1.rendered}"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "${var.task_cpu}"
  memory                   = "${var.task_memory}"

  execution_role_arn = "${var.ecs_task_role_arn}"
  task_role_arn      = "${var.ecs_task_role_arn}"
}