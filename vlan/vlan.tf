resource "nxos_bridge_domain" "vlan_mgmt" {
  name         = "Management_VLAN"
  fabric_encap = "vlan-10"
}
