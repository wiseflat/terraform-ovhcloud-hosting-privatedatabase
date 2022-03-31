resource "ovh_hosting_privatedatabase_whitelist" "whitelist" {
  service_name = var.service_name
  ip           = var.ip
  name         = var.name
  service      = var.service
  sftp         = var.sftp
}
