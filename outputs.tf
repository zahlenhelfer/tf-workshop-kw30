output "app_server_ip_addresses" {
  value = aws_instance.app_server.*.public_ip
}

output "admin_password" {
  value     = var.admin_password
  sensitive = true
}
