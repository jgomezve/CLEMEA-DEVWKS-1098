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
  url      = "https://198.18.1.100"
}

resource "nxos_feature_ospf" "ospf" {
  admin_state = "enabled"
}

module "instance_a" {
  source = "./modules/ospf"
  name   = "OSPF_A"
  interfaces = [
    {
      id   = "eth1/1"
      area = "0.0.0.0"
    },
    {
      id   = "eth1/2"
      area = "0.0.0.1"
    }
  ]
  depends_on = [nxos_feature_ospf.ospf]
}

module "instance_b" {
  source = "./modules/ospf"
  name   = "OSPF_B"
  interfaces = [
    {
      id   = "eth1/3"
      area = "0.0.0.0"
    },
    {
      id   = "eth1/4"
      area = "0.0.0.1"
    }
  ]
  depends_on = [nxos_feature_ospf.ospf]
}
