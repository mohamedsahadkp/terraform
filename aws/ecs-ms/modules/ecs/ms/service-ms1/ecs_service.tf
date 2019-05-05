resource "aws_ecs_service" "tf_ecs_service" {
  name            = "${var.project_name}-${var.project_ms_name}-${var.project_env}-service"
  cluster         = "${var.ecs_cluster_id}"
  task_definition = "${aws_ecs_task_definition.tf_ecs_task_definition.arn}"
  desired_count   = "2"
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = ["${aws_security_group.tf_ecs_service_sg.id}"]
    subnets          = ["${var.subnet_sn_01}", "${var.subnet_sn_02}"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = "${aws_alb_target_group.tf_alb_tg.arn}"
    container_name   = "${var.project_name}-${var.project_ms_name}-${var.project_env}-container"
    container_port   = "${var.container_port}"
  }

  depends_on = [
    "aws_alb_target_group.tf_alb_tg",
  ]
}