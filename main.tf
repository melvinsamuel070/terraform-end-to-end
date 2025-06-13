# This is the main file that calls all modules
# This is the main file that calls all modules

# Configure AWS provider
provider "aws" {
  region = var.aws_region
}

# Call the networking module
module "networking" {
  source = "./modules/networking"

  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]
}

module "compute" {
  source          = "./modules/compute"
  vpc_id          = module.networking.vpc_id
  public_subnets  = module.networking.public_subnet_ids
  private_subnets = module.networking.private_subnet_ids
  ami_id          = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
}


# Call the database module
module "database" {
  source = "./modules/database"

  vpc_id          = module.networking.vpc_id
  private_subnets = module.networking.private_subnet_ids
  db_username     = var.db_username
  db_password     = var.db_password
  ec2_sg_id       = module.compute.ec2_security_group_id
}

# Call the cache module
module "cache" {
  source = "./modules/cache"

  vpc_id          = module.networking.vpc_id
  private_subnets = module.networking.private_subnet_ids
  ec2_sg_id       = module.compute.ec2_security_group_id
}
