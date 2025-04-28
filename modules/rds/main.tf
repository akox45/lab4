resource "aws_db_subnet_group" "main" {
  name       = "photoalbum-db-subnet-group"
  subnet_ids = var.private_subnets
}

resource "aws_security_group" "db" {
  name        = "photoalbum-db"
  description = "Allow inbound PostgreSQL traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [var.ecs_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "main" {
  identifier           = "photoalbum-db"
  engine              = "postgres"
  engine_version      = "14"
  instance_class      = "db.t3.micro"
  allocated_storage   = 20
  storage_type        = "gp2"
  
  db_name             = "photoalbum"
  username            = "photoalbum"
  password            = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.db.id]

  backup_retention_period = 7
  skip_final_snapshot    = true

  tags = {
    Name = "photoalbum-db"
  }
} 