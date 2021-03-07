output "public_ips" {
  value = aws_instance.api_server[*].public_ip
}
