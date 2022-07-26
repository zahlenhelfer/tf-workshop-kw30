resource "aws_instance" "app_server" {
  count           = var.node_count
  ami             = var.ami_id[var.region]
  instance_type   = var.instance_type
  user_data       = file("bootstrap-webserver.sh")
  security_groups = [aws_security_group.web_access.name]

  tags = {
    Name = "MRO-AppServer ${count.index + 1}"
  }
}

resource "aws_security_group" "web_access" {
  name        = "allow_web_access"
  description = "Terraform web security group"

  # Allow outbound internet access.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
