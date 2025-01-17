terraform {
  required_providers {
    nxos = {
      source  = "CiscoDevNet/nxos"
      version = ">=0.5.0"
    }
  }
}

provider "nxos" {
  username = "cisco"
  password = "cisco"
  devices = [
    {
      name = "SW1"
      url  = "https://198.18.1.100"
    },
    {
      name = "SW2"
      url  = "https://198.18.1.101"
    }
  ]
}