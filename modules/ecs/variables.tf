variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnets" {
  description = "Private subnet IDs"
  type        = list(string)
}

variable "public_subnets" {
  description = "Public subnet IDs"
  type        = list(string)
}

variable "app_image" {
  description = "Docker image for the application"
  type        = string
}

variable "database_url" {
  description = "Database connection URL"
  type        = string
}

variable "s3_bucket_name" {
  description = "S3 bucket name for media storage"
  type        = string
} 