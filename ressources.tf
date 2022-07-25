resource "aws_instance" "app_server" {
  count         = var.node_count
  ami           = var.image_id
  instance_type = var.instance_type
  tags = {
    Name = "MRO-ExampleServer ${count.index + 1}"
  }
}
