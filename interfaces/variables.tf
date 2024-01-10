variable "vlan_name" {
  default     = "Test_VLAN"
}

variable "vlan_id" {
  default     = 20
}

variable "interface_number" {
  default = 3
}

variable "interfaces_id" {
    type    = list(string)
    default = ["1/33", "1/45", "1/50"]
}