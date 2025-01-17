resource "nxos_bridge_domain" "vlan_production" {
  for_each     = toset(["SW1", "SW2"])
  fabric_encap = "vlan-${var.vlan_id}"
  name         = var.vlan_name
  device       = each.value
}

resource "nxos_physical_interface" "phy_iface" {
  for_each     = toset(["SW1", "SW2"])
  interface_id = "eth${var.interface_id}"
  access_vlan  = "vlan-${var.vlan_id}"
  admin_state  = "up"
  layer        = "Layer2"
  mode         = "access"
  depends_on   = [nxos_bridge_domain.vlan_production]
}