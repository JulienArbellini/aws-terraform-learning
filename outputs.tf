output "public_ip" {
  description = "Public IP of EC2"
  value       = aws_instance.my_server.public_ip
}

output "public_dns" {
  description = "Public DNS"
  value       = aws_instance.my_server.public_dns
}