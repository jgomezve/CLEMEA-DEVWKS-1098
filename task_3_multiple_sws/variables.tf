variable "vlan_name" {
  default = "Management_VLAN"
}

variable "vlan_id" {
  default = 10
}

variable "interface_id" {
  default = "1/10"
}

variable "devices_info" {
  default = [
    {
      name = "SW1"
      url  = "https://198.18.1.100"
    },
    {
      name = "SW2"
      url  = "https://198.18.1.101"
    }
  ]
}

variable "devices_name" {
  default = ["SW1", "SW2"]
}