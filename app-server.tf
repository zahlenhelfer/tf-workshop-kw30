resource "aws_instance" "app_server" {
  count                  = var.node_count
  ami                    = data.aws_ami.amazon-linux-2.id #var.ami_id[var.region]
  instance_type          = var.instance_type
  user_data              = file("bootstrap-webserver.sh")
  vpc_security_group_ids = [aws_security_group.web_access.id]
  subnet_id              = aws_subnet.subnet[count.index].id

  tags = merge(var.common_tags, {
    Name = "MRO-AppSrv-${count.index + 1}"
  })

  depends_on = [
    aws_instance.db_server
  ]

}

resource "aws_security_group" "web_access" {
  name        = "allow_web_access"
  description = "Terraform web security group"
  vpc_id      = aws_vpc.main.id

  # Allow outbound internet access.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    for_each = var.sg_web_config
    content {
      description = "description ${ingress.key}"
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }

  }
}
