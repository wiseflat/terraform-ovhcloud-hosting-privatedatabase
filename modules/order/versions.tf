terraform {
  required_providers {
    ovh = {
      source  = "local/ovh/ovh"
      version = "0.16.0"
    }
  }
  required_version = ">= 1.0"
}
