resource "aws_ecs_task_definition" "tf_ecs_td" {
  family                = "${var.project_name}-${var.project_env}-ms1"
  container_definitions = <<DEFINITION
      [
        {
          "name": "wordpress",
          "links": [
            "mysql"
          ],
          "image": "wordpress",
          "image": "129800272058.dkr.ecr.eu-west-2.amazonaws.com/darisni-academy-api-admin:uat",
          "logConfiguration": {
            "logDriver": "awslogs",
            "options": {
              "awslogs-group": "/app/darisni/academy/api-uat/admin",
              "awslogs-region": "eu-west-2"
            }
          },
          "essential": true,
          "portMappings": [
            {
              "containerPort": 80,
              "hostPort": 0
            }
          ],
          "memory": 500,
          "cpu": 100
        }
      ]
  DEFINITION
}