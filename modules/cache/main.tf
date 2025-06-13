# Redis Subnet Group
resource "aws_elasticache_subnet_group" "main" {
  name       = "webapp-cache-subnet-group"
  subnet_ids = var.private_subnets

  tags = {
    Name = "webapp-cache-subnet-group"
  }
}

# Security Group for Redis
resource "aws_security_group" "cache" {
  name        = "webapp-cache-sg"
  description = "Allow Redis traffic from EC2"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 6379
    to_port         = 6379
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
    Name = "webapp-cache-sg"
  }
}

# Redis Cluster
resource "aws_elasticache_cluster" "main" {
  cluster_id           = "webapp-cache"
  engine               = "redis"
  engine_version       = "7.1"  # Latest stable version as of 2024
  node_type            = "cache.t2.micro"  # Current generation instance type
  num_cache_nodes      = 1
  parameter_group_name = "default.redis7"  # Correct parameter group for Redis 7.x
  port                 = 6379
  security_group_ids   = [aws_security_group.cache.id]
  subnet_group_name    = aws_elasticache_subnet_group.main.name

  # Recommended settings for production:
  snapshot_retention_limit = 7
  maintenance_window      = "sun:05:00-sun:06:00"
  snapshot_window         = "09:00-10:00"
  auto_minor_version_upgrade = true

  tags = {
    Name = "webapp-cache"
  }
}