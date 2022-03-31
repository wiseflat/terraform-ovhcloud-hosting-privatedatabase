output "description" {
  description = "Description"
  value       = ovh_hosting_privatedatabase_user.user
  sensitive   = true
}

output "user_name" {
  description = "Description"
  value       = ovh_hosting_privatedatabase_user.user.user_name
}
