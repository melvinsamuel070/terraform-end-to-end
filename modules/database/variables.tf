variable "vpc_id" {
  description = "VPC ID for the RDS instance"
}

variable "private_subnets" {
  type        = list(string)
  description = "Private subnet IDs for the RDS subnet group"
}

variable "db_username" {
  description = "Username for the PostgreSQL database"
  sensitive   = true
}

variable "db_password" {
  description = "Password for the PostgreSQL database"
  sensitive   = true
}

variable "ec2_sg_id" {
  description = "Security group ID of the EC2 instance allowed to access RDS"
}
