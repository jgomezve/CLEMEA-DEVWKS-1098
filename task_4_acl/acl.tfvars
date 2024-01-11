acl_name = "CLEU_ACL"

entries = [{
  sequence_number    = 10
  protocol           = "ip"
  action             = "permit"
  source_prefix      = "10.1.1.0"
  source_mask        = "24"
  destination_prefix = "192.168.0.0"
  destination_mask   = "16"
  },
  {
    sequence_number    = 30
    protocol           = "ip"
    action             = "permit"
    source_prefix      = "10.1.3.0"
    source_mask        = "24"
    destination_prefix = "192.168.0.0"
    destination_mask   = "16"
  }
]
