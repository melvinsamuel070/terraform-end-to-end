






variable "private_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}


variable "vpc_id" {
  description = "The VPC ID"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnet IDs"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "key_name" {
  description = "SSH key pair name"
}
