data "template_file" "cb_app" {
  template = "${file("terraform/templates/ecs/cb_app.json.tpl")}"

  vars {
    app_image      = "${var.app_image}"
    fargate_cpu    = "${var.fargate_cpu}"
    fargate_memory = "${var.fargate_memory}"
    aws_region     = "${var.aws_region}"
    app_port       = "${var.app_port}"
  }
}

resource "aws_ecs_task_definition" "tf_ecs_task_definition" {
  family            = "${var.project_name}-${var.project_env}-${var.project_ms_name}-family"
  execution_role_arn       = "${var.ecs_task_execution_role}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "${var.fargate_cpu}"
  memory                   = "${var.fargate_memory}"
  container_definitions    = "${data.template_file.cb_app.rendered}"
}

resource "aws_ecs_service" "tf_ecs_service" {
  name            = "${var.project_name}-${var.project_env}-${var.project_ms_name}-service"
  cluster         = "${aws_ecs_cluster.tf_ecs_cluster.id}"
  task_definition = "${aws_ecs_task_definition.tf_ecs_task_definition.arn}"
  desired_count   = "${var.app_count}"
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = ["${aws_security_group.tf_ecs_service_sg.id}"]
    subnets         = ["${aws_subnet.tf_public_sn_01.id}", "${aws_subnet.tf_public_sn_02.id}"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = "${aws_alb_target_group.app.id}"
    container_name   = "${var.project_name}-${var.project_env}-${var.project_ms_name}-container"
    container_port   = "${var.app_port}"
  }

  depends_on = [
    "aws_alb_listener.front_end",
  ]
}