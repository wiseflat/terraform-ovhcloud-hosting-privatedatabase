resource "ovh_hosting_privatedatabase_database" "database" {
  service_name  = var.service_name
  database_name = var.database_name
}
