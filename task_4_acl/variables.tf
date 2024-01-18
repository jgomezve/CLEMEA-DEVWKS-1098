variable "acl_name" {
  description = "Access-list name."
  type        = string
}

variable "entries" {
  description = "Access-list entries."
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
