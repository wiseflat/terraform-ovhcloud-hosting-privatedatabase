output "instance" {
  description = "Order description"
  value       = data.ovh_hosting_privatedatabase.instance
}

output "description" {
  description = "Database description"
  value = {
    database   = module.database
    users      = module.user.*.user_name
    grants     = module.grant
    whitelists = module.whitelist
  }
}
