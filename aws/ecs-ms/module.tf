module "vpc" {
  source         = "./modules/vpc"
  project_name   = "${var.project_name}"
  project_environment   = "${var.project_environment}"
}

module "ecs" {
  source              = "./modules/ecs"

  project_name          = "${var.project_name}"
  project_environment   = "${var.project_environment}"
  vpc_id                = "${module.vpc.vpc_id}"
  public_subnet_1a      = "${module.vpc.public_subnet_1a}"
  public_subnet_1b      = "${module.vpc.public_subnet_1b}"
}

module "rds" {
  source              = "./modules/rds"
}