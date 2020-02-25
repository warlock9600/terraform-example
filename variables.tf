# vcd variables

variable "vcd_user" {
    description = "vCloud user"
}
variable "vcd_pass" {
    description = "vCloud pass"
}
variable "vcd_org" {
    description = "vCloud org"
}
variable "vcd_vdc" {
    description = "vCloud VDC"
}
variable "vcd_url" {
    description = "vCloud url"
}

# network variables

variable "vcd_edge_name" {
    description = "def edge name"
}

variable "vcd_ext_ip1" {
    description = "def main ip"
}

variable "vcd_ext_net" {
    description = "vcd external network"  
}


