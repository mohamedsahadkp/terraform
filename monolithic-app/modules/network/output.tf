output "vpc_id" {
  value = aws_vpc.vpc.id
}
output "subnet_one" {
  value = aws_subnet.subnet_public_one.id
}
output "subnet_two" {
  value = aws_subnet.subnet_public_two.id
}
