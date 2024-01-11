variable "acl_name" {
  type = string
}

variable "entries" {
  type = list(object({
    sequence_number    = number
    protocol           = string
    action             = string
    destination_prefix = string
    destination_mask   = string
    source_prefix      = string
    source_mask        = string
  }))
}
