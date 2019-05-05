output "vpc_id" {
  value = "${aws_vpc.tf_vpc.id}"
}

output "public_subnet_1a" {
  value = "${aws_subnet.tf_public_sn_01.id}"
}

output "public_subnet_1b" {
  value = "${aws_subnet.tf_public_sn_02.id}"
}