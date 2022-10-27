resource "aws_db_subnet_group" "rds" {
  name       = "${var.unique_name}-rds"
  subnet_ids = module.vpc.database_subnets
}

resource "aws_security_group" "rds" {
  name   = "${var.unique_name}-rds"
  vpc_id = module.vpc.vpc_id
  tags   = local.tags

ingress {
    from_port       = db_port
    to_port         = db_port
    protocol        = "tcp"
    security_groups = [aws_security_group.ecs_service.id]
}
egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}