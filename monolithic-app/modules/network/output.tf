output "ec2_public_dns_1" {
  value = "${aws_instance.application_server[0].public_dns}"
}
output "ec2_public_dns_2" {
  value = "${aws_instance.application_server[1].public_dns}"
}

output "ec2_private_ip_1" {
  value = "${aws_instance.application_server[0].private_ip}"
}
output "ec2_private_ip_2" {
  value = "${aws_instance.application_server[1].private_ip}"
}
