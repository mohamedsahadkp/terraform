module "service-ms1" {
  source                = "./ms/service-ms1"
  project_name          = "${var.project_name}"
  project_environment   = "${var.project_environment}"

  vpc_id                = "${var.vpc_id}"
  public_subnet_1a      = "${var.public_subnet_1a}"
  public_subnet_1b      = "${var.public_subnet_1b}"

  ecs_cluster_id        = "${aws_ecs_cluster.tf_ecs_cluster.id}"

  alb_arn               = "${aws_alb.tf_alb.arn}"


  app_sg_id           = "${module.vpc.app_sg_id}"
  alb_sg_id           = "${module.vpc.alb_sg_id}"
  ecs_sg_id           = "${module.vpc.ecs_sg_id}"
  app_repository_name = "${var.app_repository_name}"
  alb_port            = "${var.alb_port}"
  container_port      = "${var.container_port}"
  min_tasks           = "${var.min_tasks}"
  max_tasks           = "${var.max_tasks}"
  cpu_to_scale_up     = "${var.cpu_to_scale_up}"
  cpu_to_scale_down   = "${var.cpu_to_scale_down}"
  desired_tasks       = "${var.desired_tasks}"
  desired_task_cpu    = "${var.desired_task_cpu}"
  desired_task_memory = "${var.desired_task_memory}"

  security_groups_ids = [
    "${module.vpc.app_sg_id}",
    "${module.vpc.alb_sg_id}",
    "${module.vpc.ecs_sg_id}",
  ]

  availability_zones = [
    "${module.vpc.public_subnet_1a}",
    "${module.vpc.public_subnet_1b}",
  ]
}