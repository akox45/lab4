terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  cloud {
    organization = "photoalbum-org"
    workspaces {
      name = "photoalbum-workspace"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

# VPC and Network Configuration
module "vpc" {
  source = "./modules/vpc"
}

# ECS Cluster and Service
module "ecs" {
  source = "./modules/ecs"
  vpc_id = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  public_subnets  = module.vpc.public_subnets
  app_image = var.app_image
  depends_on = [module.vpc]
}

# RDS Database
module "rds" {
  source = "./modules/rds"
  vpc_id = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  depends_on = [module.vpc]
}

# S3 Bucket for Media Storage
module "s3" {
  source = "./modules/s3"
} 