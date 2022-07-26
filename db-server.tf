resource "aws_instance" "db_server" {
  count         = var.database_needed ? 1 : 0
  ami           = var.ami_id[var.region]
  instance_type = var.instance_type
}
