output "ecs_cluster_id" {
  value = "${aws_ecs_cluster.tf_ecs_cluster.id}"
}

output "alb_arn" {
  value = "${aws_alb.tf_alb.arn}"
}

output "alb_listener" {
  value = "${aws_alb_listener.tf_alb_listener.arn}"
}

output "alb_dns_name" {
  value = "${aws_alb.tf_alb.dns_name}"
}
