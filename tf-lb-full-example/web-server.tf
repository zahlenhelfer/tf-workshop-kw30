resource "aws_instance" "app_server" {
  count                  = var.node_count
  ami                    = data.aws_ami.amazon-linux-2.id
  instance_type          = var.instance_type
  user_data              = file("bootstrap-webserver.sh")
  vpc_security_group_ids = [aws_security_group.web_access.id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = merge(var.common_tags, {
    Name = "MRO-AppSrv-${count.index + 1}"
  })

}

resource "aws_security_group" "web_access" {
  name        = "allow_web_access"
  description = "Terraform web security group"
  vpc_id      = module.vpc.vpc_id

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
