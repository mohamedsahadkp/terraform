########################### App Config ################################
variable "project_name" {
  description = "project_name"
}

variable "project_environment" {
  description = "project_environment"
}

variable "microservices_name" {
  description = "microservices_name"
  default = "m1"
}
########################### ECS Cluster ################################
variable "ecs_cluster_id" {
  description = "ecs cluster id"
}

########################### VPC ################################
variable "vpc_id" {
  description = "vpc id"
}

variable "subnet_sn_01" {
  description = "subnet_sn_01"
}

variable "subnet_sn_02" {
  description = "subnet_sn_02"
}

########################### ALB ################################
variable "alb_arn" {
  description = "application loadbalancer arn"
}

variable "alb_port" {
  description = "application loadbalancer arn"
  default = "80"
}
########################### MS Config ################################


variable "health_check_path" {
  description = "health check path"
  default = "/"
}

variable "container_port" {
  description = "Container port"
  default = "3001"
}

variable "task_cpu" {
  description = "CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "512"
}

variable "task_memory" {
  description = "Memory to provision (in MiB)"
  default     = "1024"
}

variable "ecs_service_role_arn" {
  description = "ecs_service_role_arn"
  default     = "arn:aws:iam::129800272058:role/ecsServiceRole"
}

variable "ecs_task_role_arn" {
  description = "ecs_task_role_arn"
  default     = "arn:aws:iam::129800272058:role/ecsTaskExecutionRole"
}