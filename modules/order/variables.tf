variable "subsidiary" {
  description = "Subsidiary"
  type        = string
  default     = "fr"
}

variable "description" {
  description = "Cart description"
  type        = string
  default     = "my privateSQL order cart"
}

variable "price_capacity" {
  description = "Price capacity"
  type        = string
  default     = "renew"
}

variable "product" {
  description = "Product"
  type        = string
  default     = "privateSQL"
}

variable "name" {
  description = "Private SQL name"
  type        = string
}

variable "tech_account" {
  description = "Technical account"
  type        = string
}

variable "plan_code" {
  description = "Plan code"
  type        = string
}

variable "datacenter" {
  description = "Datacenter"
  type        = string
  default     = "gra3"
}

variable "engine" {
  description = "DB engine"
  type        = string
}
