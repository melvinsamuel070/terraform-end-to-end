# ALB DNS Name (where you access your website)
output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = module.compute.alb_dns_name
}

# RDS Endpoint (for database connections)
output "rds_endpoint" {
  description = "Endpoint of the RDS database"
  value       = module.database.rds_endpoint
}

# Redis Endpoint (for cache connections)
output "redis_endpoint" {
  description = "Endpoint of the Redis cache"
  value       = module.cache.redis_endpoint
}