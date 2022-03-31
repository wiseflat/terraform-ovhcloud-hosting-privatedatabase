resource "ovh_hosting_privatedatabase_user" "user" {
  service_name = var.service_name
  password     = sensitive(var.password)
  user_name    = var.user_name

  # Password is excluded for a specific reason.
  # In case of resource import, password value is set as null in state file. terraform wants to recreate it
  lifecycle {
    ignore_changes = [password]
  }
}
