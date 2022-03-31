provider "ovh" {
  endpoint = "ovh-eu"
}

module "order" {
  source = "./../../modules/order"

  name         = var.order.name
  tech_account = var.order.tech_account
  plan_code    = var.order.plan_code
  datacenter   = var.order.datacenter
  engine       = var.order.engine
}

module "whitelist" {
  source = "./../../modules/whitelist"

  count = length(var.whitelists)

  service_name = module.order.description.service_name

  ip      = var.whitelists[count.index].ip
  name    = var.whitelists[count.index].name
  service = var.whitelists[count.index].service
  sftp    = var.whitelists[count.index].sftp
}
