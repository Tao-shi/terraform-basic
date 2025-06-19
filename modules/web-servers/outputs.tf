output "web_server_ips" {
  description = "The public IP addresses of the web servers"
  value       = aws_instance.web_server[*].public_ip
}

output "instance_ids" {
  value = aws_instance.web_server[*].id
}