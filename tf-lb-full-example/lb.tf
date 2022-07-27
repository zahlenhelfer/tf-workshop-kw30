resource "aws_alb" "alb" {
  name            = "mro-terraform-example-alb"
  security_groups = [aws_security_group.alb_web_access.id]
  subnets         = module.vpc.public_subnets
}

resource "aws_alb_listener" "listener_http" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_alb_target_group.web-group.arn
    type             = "forward"
  }
}

resource "aws_lb_target_group_attachment" "alb-attachment" {
  count            = var.node_count
  target_group_arn = aws_alb_target_group.web-group.arn
  target_id        = aws_instance.app_server[count.index].id
  port             = 80
}

resource "aws_security_group" "alb_web_access" {
  name        = "allow lb web_access"
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
    for_each = var.sg_lb_web_config
    content {
      description = "description ${ingress.key}"
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }

  }
}
