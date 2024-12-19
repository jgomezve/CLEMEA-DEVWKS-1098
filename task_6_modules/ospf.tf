resource "nxos_feature_ospf" "feature_ospf" {
  admin_state = "enabled"
}

resource "nxos_ospf" "ospf_entity" {
  admin_state = "enabled"
  depends_on  = [nxos_feature_ospf.feature_ospf]
}

resource "nxos_physical_interface" "test_iface" {
  interface_id             = "eth1/20"
  layer                    = "Layer3"
}


module "ospf_a" {
  source  = "netascode/ospf/nxos"
  version = ">= 0.3.0"

  name = "OSPFA"
  vrfs = [
    {
      vrf                      = "default"
      admin_state              = true
      router_id                = "100.1.1.1"
      areas = [
        {
          area = "0.0.0.0"
          type = "regular"
        }
      ]
      interfaces = [
        {
          interface    = "eth1/20"
          area         = "0.0.0.0"
          cost         = 1000
          network_type = "p2p"
          priority     = 100
        }
      ]
    }
  ]
   depends_on = [nxos_physical_interface.test_iface, nxos_ospf.ospf_entity]

}