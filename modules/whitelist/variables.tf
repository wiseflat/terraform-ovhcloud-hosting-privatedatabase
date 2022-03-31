variable "service_name" {
  description = "Service name"
  type        = string
}

variable "ip" {
  description = "Ip to whitelist"
  type        = string
}

variable "name" {
  description = "Whitelist label"
  type        = string
}

variable "service" {
  description = "Give permission on service port"
  type        = bool
}

variable "sftp" {
  description = "Give permission on sftp port"
  type        = bool
}
