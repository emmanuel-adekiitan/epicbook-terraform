provider "aws" {
  region = var.aws_region
}

resource "aws_key_pair" "ansible_key" {
  key_name   = "epicbook-deployer"
  public_key = file(pathexpand("~/.ssh/id_ansible_rsa.pub"))
}

# 1. Network: VPC, Subnets, and IGW
module "vpc" {
  source = "./modules/vpc"
  region = var.aws_region
}

# 2. Security: Firewall rules for EC2 and RDS
module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}

# 3. Compute: The Ubuntu VM and Application Setup
module "compute" {
  source           = "./modules/compute"
  public_subnet_id = module.vpc.public_subnet_id
  web_sg_id        = module.security.web_sg_id
  key_name = aws_key_pair.ansible_key.key_name
}

# 4. Database: RDS MySQL Instance
module "database" {
  source             = "./modules/database"
  private_subnet_ids = module.vpc.private_subnet_ids # Passing the list
  rds_sg_id          = module.security.rds_sg_id
  db_password        = var.db_password
}