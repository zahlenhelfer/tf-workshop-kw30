output "app_server_ip_addresses" {
  value = aws_instance.app_server.*.public_ip
}
