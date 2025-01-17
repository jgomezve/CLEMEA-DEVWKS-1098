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
  url      = "https://198.18.1.100"
}

resource "nxos_ipv4_access_list" "acl" {
  name = "CSV_ACL"
}

resource "nxos_ipv4_access_list_entry" "acl_entry" {
  for_each                  = { for entry in csvdecode(file("acl.csv")) : entry.sequence_number => entry }
  name                      = "CSV_ACL"
  sequence_number           = each.value.sequence_number
  protocol                  = each.value.protocol
  action                    = each.value.action
  source_prefix             = each.value.source_prefix
  source_prefix_length      = each.value.source_mask
  destination_prefix        = each.value.destination_prefix
  destination_prefix_length = each.value.destination_mask

  depends_on = [nxos_ipv4_access_list.acl]
}

output "csvdecode_format" {
  value = csvdecode(file("acl.csv"))
}