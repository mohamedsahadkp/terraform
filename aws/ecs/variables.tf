
########################### VPC Config ################################

variable "network_cidr" {
  description = "IP addressing for Network"
}

variable "public_01_cidr" {
  description = "Public 0.0 CIDR for externally accessible subnet"
}

variable "public_02_cidr" {
  description = "Public 0.0 CIDR for externally accessible subnet"
}

########################### Autoscale Config ################################

variable "max_instance_size" {
  description = "Maximum number of instances in the cluster"
}

variable "min_instance_size" {
  description = "Minimum number of instances in the cluster"
}

variable "desired_capacity" {
  description = "Desired number of instances in the cluster"
}

########################### Project Config ################################

variable "project_name" {
  description = "ECS cluster name"
}

variable "project_env" {
  description = "EC2 instance key pair name"
}

########################### General Config ################################

variable "region" {
  description = "AWS region"
}

variable "availability_zone" {
  description = "availability zone used for the demo, based on region"
  default = {
    us-east-1 = "us-east-1"
  }
}













variable "ecs_cluster" {
  description = "ECS cluster name"
}

variable "ecs_key_pair_name" {
  description = "EC2 instance key pair name"
}



