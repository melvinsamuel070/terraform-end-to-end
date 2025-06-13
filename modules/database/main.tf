# RDS Subnet Group (spreads DB across private subnets)
resource "aws_db_subnet_group" "main" {
  name       = "webapp-db-subnet-group"
  subnet_ids = var.private_subnets

  tags = {
    Name = "webapp-db-subnet-group"
  }
}

# Security Group for PostgreSQL RDS
resource "aws_security_group" "db" {
  name        = "webapp-db-sg"
  description = "Allow PostgreSQL traffic from EC2"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [var.ec2_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "webapp-db-sg"
  }
}

# PostgreSQL RDS Instance
resource "aws_db_instance" "main" {
  identifier              = "webapp-db"
  engine                  = "postgres"
  engine_version         = "15.13"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  username                = "webadmin"
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.main.name
  vpc_security_group_ids  = [aws_security_group.db.id]
  skip_final_snapshot     = true
  publicly_accessible     = false

  tags = {
    Name = "webapp-postgres-db"
  }
}
