resource "aws_cloudwatch_log_group" "tf_cloudwatch_log_group" {
  name = "${var.project_name}-${var.microservices_name}-${var.project_environment}-logs"

  tags {
    Project = "${var.project_name}"
    Microservice = "${var.microservices_name}"
    Environment = "${var.project_environment}"
  }
}