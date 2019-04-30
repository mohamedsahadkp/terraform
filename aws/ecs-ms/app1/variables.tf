########################### App Config ################################
variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "project_name" {
  description = "maphabit"
  default = "maphabit"
}

variable "project_env" {
  description = "development"
  default = "development"
}

########################### MS Config ################################
variable "project_ms_name" {
  description = "auth"
  default = "auth"
}

variable "health_check_path" {
  default = "/"
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "1024"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "2048"
}