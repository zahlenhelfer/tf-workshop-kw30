resource "aws_alb_target_group" "web-group" {
  name     = "mro-terraform-example-alb-target"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
  health_check {
    path = "/"
    port = 80
  }
}
