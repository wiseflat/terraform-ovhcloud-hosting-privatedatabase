variable "service_name" {
  description = "Service name"
  type        = string
}

variable "user_name" {
  description = "User name"
  type        = string
}

variable "password" {
  description = "Password"
  type        = string
  sensitive   = true
}
