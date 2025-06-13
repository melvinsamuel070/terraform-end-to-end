variable "vpc_id" {
  description = "The VPC ID where Redis will be deployed"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet IDs for Redis subnet group"
}

variable "ec2_sg_id" {
  description = "Security group ID of the EC2 instance allowed to access Redis"
}
