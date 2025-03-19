variable "heroku_email" {
  description = "A Heroku-fiókhoz tartozó e-mail cím"
  type        = string
}

variable "heroku_api_key" {
  description = "A Heroku API kulcs"
  type        = string
  sensitive   = true
}

variable "app_name" {
  description = "A Heroku alkalmazás neve"
  type        = string
  default     = "photoalbum-app"
}

variable "secret_key" {
  description = "Django SECRET_KEY"
  type        = string
  sensitive   = true
}