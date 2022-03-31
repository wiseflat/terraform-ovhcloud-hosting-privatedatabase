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

variable "databases" {
  description = "List of databases"
  type        = list(string)
  default     = []
}

variable "users" {
  description = "Array of users"
  type = list(object({
    name     = string
    password = string
  }))
  default = []
}

variable "grants" {
  description = "Array of grants"
  type = list(object({
    database = string
    user     = string
    grant    = string
  }))
  default = []
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
