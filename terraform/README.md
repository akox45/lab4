# Photoalbum Infrastructure

This directory contains the Terraform configuration for deploying the Photoalbum application infrastructure on AWS.

## Architecture

The infrastructure consists of the following components:

- VPC with public and private subnets
- ECS Fargate cluster for running the application
- Application Load Balancer for distributing traffic
- RDS PostgreSQL database
- S3 bucket for media storage
- IAM roles and security groups

## Prerequisites

1. AWS account and credentials
2. Terraform Cloud account
3. GitHub account
4. The following secrets set in GitHub:
   - `TF_API_TOKEN`: Terraform Cloud API token
   - `AWS_ACCESS_KEY_ID`: AWS access key
   - `AWS_SECRET_ACCESS_KEY`: AWS secret key

## Setup

1. Create a workspace in Terraform Cloud
2. Configure the workspace variables:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `TF_WORKSPACE`
   - Environment-specific variables (if any)

3. Push the code to GitHub
4. The GitHub Actions workflow will automatically:
   - Run Terraform format check
   - Initialize Terraform
   - Validate the configuration
   - Plan changes (on pull requests)
   - Apply changes (on merge to main)

## Module Structure

- `vpc/`: Network configuration
- `ecs/`: Application deployment
- `rds/`: Database configuration
- `s3/`: Media storage

## Cost Optimization

The infrastructure is designed to be cost-effective:
- Using Fargate for serverless container management
- t3.micro RDS instance
- S3 standard storage
- Free tier eligible components where possible 