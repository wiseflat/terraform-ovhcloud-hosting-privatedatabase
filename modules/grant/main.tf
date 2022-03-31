resource "ovh_hosting_privatedatabase_user_grant" "grant" {
  service_name  = var.service_name
  database_name = var.database_name
  user_name     = var.user_name
  grant         = var.grant_name
}
