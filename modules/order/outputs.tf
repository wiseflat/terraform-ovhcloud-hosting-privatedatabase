output "description" {
  description = "Full instance order description"
  value       = ovh_hosting_privatedatabase.instance
}

output "description_short" {
  description = "Short instance order description"
  value = {
    description = {
      datacenter   = ovh_hosting_privatedatabase.instance.datacenter
      display_name = ovh_hosting_privatedatabase.instance.display_name
      hostname     = ovh_hosting_privatedatabase.instance.hostname
    }
    port = {
      service = ovh_hosting_privatedatabase.instance.port
      sftp    = ovh_hosting_privatedatabase.instance.port_ftp
    }
    states = {
      state      = ovh_hosting_privatedatabase.instance.state
      quota_size = ovh_hosting_privatedatabase.instance.quota_size
      quota_used = ovh_hosting_privatedatabase.instance.quota_used
    }
    version = ovh_hosting_privatedatabase.instance.version
    compute = {
      cpu = ovh_hosting_privatedatabase.instance.cpu
      ram = ovh_hosting_privatedatabase.instance.ram
    }
  }
}
