variable "name" {
  type = string
}

variable "vrf" {
  type    = string
  default = "default"
}

variable "interfaces" {
  type = list(object({
    id   = string
    area = string
  }))
}
