terraform {
  required_version = ">= 1.4.0"
  required_providers {
    nxos = {
      source  = "CiscoDevNet/nxos"
      version = ">=0.4.2"
    }
  }
}

provider "nxos" {
  username = "cisco"
  password = "cisco"
  devices = [{
    name = "SW1"
    url  = "https://198.18.1.100"
    },
    {
      name = "SW2"
      url  = "https://198.18.1.101"
  }]
}

resource "nxos_bridge_domain" "vlan_mgmt" {
  for_each     = toset(["SW1", "SW2"])
  fabric_encap = "vlan-11"
  name         = "TEST_VLAN"
  device       = each.value
}
