resource "aws_instance" "app_server" {
  count         = var.node_count
  ami           = var.ami_id[var.region]
  instance_type = var.instance_type
  user_data     = file(bootstrap-webserver.sh)

  tags = {
    Name = "MRO-AppServer ${count.index + 1}"
  }
}

resource "aws_instance" "db_server" {
  count         = var.database_needed ? 1 : 0
  ami           = var.ami_id[var.region]
  instance_type = var.instance_type
  tags = {
    Name = "MRO-Database-Server ${count.index + 1}"
  }
}
