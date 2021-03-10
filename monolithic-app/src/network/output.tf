output "id" {
  value = aws_vpc.vpc.id
}
output "subnet_one_id" {
  value = aws_subnet.subnet_public_one.id
}
output "subnet_two_id" {
  value = aws_subnet.subnet_public_two.id
}
