output "ecs_cluster_id" {
  value = "${aws_ecs_cluster.tf_ecs_cluster.id}"
}

output "alb_arn" {
  value = "${aws_alb.tf_alb.arn}"
}
