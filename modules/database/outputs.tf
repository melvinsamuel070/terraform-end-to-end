output "db_endpoint" {
  value = aws_db_instance.main.endpoint
}

output "db_sg_id" {
  value = aws_security_group.db.id
}



output "rds_endpoint" {
  value = aws_db_instance.main.endpoint
}
