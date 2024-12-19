terraform {
  required_version = ">= 1.4.0"
  required_providers {
    nxos = {
      source  = "CiscoDevNet/nxos"
      version = ">=0.5.0"
    }
  }
}

provider "nxos" {
  username = "admin"
  password = "cisco.123"
  url      = "https://10.122.18.82"
}