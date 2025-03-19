terraform {
  required_providers {
    heroku = {
      source  = "heroku/heroku"
      version = "~> 5.0"
    }
  }
}

provider "heroku" {
  email   = var.heroku_email
  api_key = var.heroku_api_key
}

# Heroku alkalmazás létrehozása
resource "heroku_app" "photoalbum" {
  name   = var.app_name
  region = "eu"  # Vagy "us" az USA-ban

  config_vars = {
    SECRET_KEY     = var.secret_key
    ALLOWED_HOSTS  = "${var.app_name}.herokuapp.com"
  }

  buildpacks = [
    "heroku/python"
  ]
}

# PostgreSQL adatbázis létrehozása
resource "heroku_addon" "database" {
  app_id = heroku_app.photoalbum.id
  plan   = "heroku-postgresql:hobby-dev"
}