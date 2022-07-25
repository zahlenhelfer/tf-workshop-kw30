resource "aws_instance" "app_server" {
  count         = var.node_count
  ami           = var.ami_id[var.region]
  instance_type = var.instance_type
  tags = {
    Name = "MRO-ExampleServer ${count.index + 1}"
  }
}
