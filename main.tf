provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.9"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "projetodevopstf"
    key = "states/eks_terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}

module "vpc" {
  source = "./vpc"
}

module "sec_group" {
  source = "./sec_group"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./ec2"
  public_subnet_1a = module.vpc.public_subnet_1a
  public_subnet_1b = module.vpc.public_subnet_1b
  private_subnet_1a = module.vpc.private_subnet_1a
  private_subnet_1b = module.vpc.private_subnet_1b
  security_group_id = module.sec_group.aws_security_group
}