provider "ovh" {
  endpoint = "ovh-eu"
}

data "ovh_hosting_privatedatabase" "instance" {
  service_name = var.instance
}

module "database" {
  source = "./../../modules/database"

  count = length(var.databases)

  service_name = data.ovh_hosting_privatedatabase.instance.service_name

  database_name = var.databases[count.index]
}

module "user" {
  source = "./../../modules/user"

  count = length(var.users)

  service_name = data.ovh_hosting_privatedatabase.instance.service_name

  user_name = var.users[count.index].name
  password  = var.users[count.index].password

  depends_on = [module.database]
}

module "grant" {
  source = "./../../modules/grant"

  count = length(var.grants)

  service_name = data.ovh_hosting_privatedatabase.instance.service_name

  database_name = var.grants[count.index].database
  user_name     = var.grants[count.index].user
  grant_name    = var.grants[count.index].grant

  depends_on = [
    module.database,
    module.user
  ]
}

module "whitelist" {
  source = "./../../modules/whitelist"

  count = length(var.whitelists)

  service_name = data.ovh_hosting_privatedatabase.instance.service_name

  ip      = var.whitelists[count.index].ip
  name    = var.whitelists[count.index].name
  service = var.whitelists[count.index].service
  sftp    = var.whitelists[count.index].sftp
}
