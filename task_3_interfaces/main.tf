terraform {
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
  url      = "https://198.18.1.100"
}

resource "nxos_bridge_domain" "vlan_test" {
  fabric_encap = "vlan-${var.vlan_id}"
  name         = var.vlan_name
}

resource "nxos_physical_interface" "phy_iface" {
  count        = var.interface_number
  interface_id = "eth1/2${count.index}"
  access_vlan  = "vlan-${var.vlan_id}"
  admin_state  = "up"
  layer        = "Layer2"
  mode         = "access"
  depends_on   = [nxos_bridge_domain.vlan_test]
}
