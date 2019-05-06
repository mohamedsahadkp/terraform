resource "aws_ecs_service" "tf_ecs_service" {
  name            = "${var.project_name}-${var.microservices_name}-${var.project_environment}-service"
  task_definition = "${aws_ecs_task_definition.tf_ecs_task_definition.arn}"
  cluster         = "${var.ecs_cluster_id}"
  launch_type     = "FARGATE"
  desired_count   = "${var.desired_tasks}"

  network_configuration {
    security_groups  = ["${aws_security_group.tf_ecs_service_sg.id}"]
    subnets          = ["${var.public_subnet_1a}", "${var.public_subnet_1b}"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = "${aws_alb_target_group.tf_alb_tg.arn}"
    container_name   = "${var.project_name}-${var.microservices_name}-${var.project_environment}-container"
    container_port   = "${var.container_port}"
  }

  depends_on = ["aws_alb_target_group.tf_alb_tg"]
}