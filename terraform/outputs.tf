output "app_url" {
  value       = "https://${heroku_app.photoalbum.name}.herokuapp.com"
  description = "Az alkalmazás URL-je"
}

output "app_name" {
  value       = heroku_app.photoalbum.name
  description = "Az alkalmazás neve"
}

output "database_url" {
  value       = heroku_addon.database.config_var_values.DATABASE_URL
  description = "Az adatbázis URL-je"
  sensitive   = true
}