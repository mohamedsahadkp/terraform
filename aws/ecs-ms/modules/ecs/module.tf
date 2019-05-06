module "service-ms1" {
  source                = "./ms/service-ms1"
  project_name          = "${var.project_name}"
  project_environment   = "${var.project_environment}"

  vpc_id                = "${var.vpc_id}"
  public_subnet_1a      = "${var.public_subnet_1a}"
  public_subnet_1b      = "${var.public_subnet_1b}"

  ecs_cluster_id        = "${aws_ecs_cluster.tf_ecs_cluster.id}"

  alb_arn               = "${aws_alb.tf_alb.arn}"
}

module "service-ms2" {
  source                = "./ms/service-ms2"
  project_name          = "${var.project_name}"
  project_environment   = "${var.project_environment}"

  vpc_id                = "${var.vpc_id}"
  public_subnet_1a      = "${var.public_subnet_1a}"
  public_subnet_1b      = "${var.public_subnet_1b}"

  ecs_cluster_id        = "${aws_ecs_cluster.tf_ecs_cluster.id}"

  alb_arn               = "${aws_alb.tf_alb.arn}"
}