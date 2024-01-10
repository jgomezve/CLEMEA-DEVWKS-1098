terraform {
  required_version = ">= 1.4.0"
  required_providers {
    nxos = {
      source  = "CiscoDevNet/nxos"
      version = ">=0.4.2"
    }
  }
}
