output "order" {
  description = "Order description"
  value = {
    datacenter    = module.order.description.datacenter
    display_name  = module.order.description.display_name
    service_name  = module.order.description.service_name
    hostname      = module.order.description.hostname
    port          = module.order.description.port
    port_ftp      = module.order.description.port_ftp
    state         = module.order.description.state
    type          = module.order.description.type
    version_label = module.order.description.version_label
  }
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
