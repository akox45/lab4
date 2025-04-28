variable "app_image" {
  description = "Docker image for the application"
  type        = string
  default     = "photoalbum:latest"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "eu-central-1"
} 