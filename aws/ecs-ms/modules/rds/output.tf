output "db_instance_id" {
  value = "${aws_db_instance.tf_db_instance.id}"
}

output "db_instance_address" {
  value = "${aws_db_instance.tf_db_instance.address}"
}