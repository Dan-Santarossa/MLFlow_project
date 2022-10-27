resource "aws_security_group" "ecs_service" {
  name = "${var.unique_name}-ecs-service"
  tags = local.tags

  vpc_id = module.vpc.vpc_id

  ingress {
    from_port       = local.oauth2_proxy_port
    to_port         = local.oauth2_proxy_port
    protocol        = "tcp"
    security_groups = [aws_security_group.lb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "lb" {
  name   = "${var.unique_name}-lb"
  tags   = local.tags
  vpc_id = module.vpc.vpc_id
}