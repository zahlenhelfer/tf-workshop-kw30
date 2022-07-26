output "app_server_ip_addresses" {
  value = aws_instance.app_server.*.public_ip
}

output "ami-id" {
  value = data.aws_ami.amazon-linux-2
}

output "az" {
  value = data.aws_availability_zones.available
}
