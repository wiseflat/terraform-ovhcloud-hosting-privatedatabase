variable "order" {
  description = "List of databases"
  type = object({
    name         = string
    tech_account = string
    plan_code    = string
    datacenter   = string
    engine       = string
  })
}

variable "whitelists" {
  description = "Array of whitelists ip address"
  type = list(object({
    ip      = string
    name    = string
    service = bool
    sftp    = bool
  }))
  default = []
}
