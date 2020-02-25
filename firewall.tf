# SNAT rules

resource "vcd_nsxv_snat" "backend-snat" {
  org = "${var.vcd_org}" # Optional
  vdc = "${var.vcd_vdc}" # Optional

  edge_gateway = "${var.vcd_edge_name}"
  network_type = "ext"
  network_name = "${var.vcd_ext_net}"

  original_address   = "10.200.10.0/24"
  translated_address = "${var.vcd_ext_ip1}"
}

resource "vcd_nsxv_snat" "frontend-snat" {
  org = "${var.vcd_org}" # Optional
  vdc = "${var.vcd_vdc}" # Optional

  edge_gateway = "${var.vcd_edge_name}"
  network_type = "ext"
  network_name = "${var.vcd_ext_net}"

  original_address   = "10.200.20.0/24"
  translated_address = "${var.vcd_ext_ip1}"
}

resource "vcd_nsxv_snat" "dmz-snat" {
  org = "${var.vcd_org}" # Optional
  vdc = "${var.vcd_vdc}" # Optional

  edge_gateway = "${var.vcd_edge_name}"
  network_type = "ext"
  network_name = "${var.vcd_ext_net}"

  original_address   = "10.200.30.0/24"
  translated_address = "${var.vcd_ext_ip1}"
}

# DNAT rules

resource "vcd_nsxv_dnat" "proxy-test01-http" {
  org = "${var.vcd_org}" # Optional
  vdc = "${var.vcd_vdc}" # Optional

  edge_gateway = "${var.vcd_edge_name}"
  network_name = "${var.vcd_ext_net}"
  network_type = "ext"

  enabled = true
  logging_enabled = false
  description = "http for proxy"

  original_address   = "${var.vcd_ext_ip1}"
  original_port      = 80

  translated_address = "${vcd_vapp_vm.proxy-test01.network[0].ip}"
  translated_port    = 80
  protocol           = "tcp"
}

resource "vcd_nsxv_dnat" "proxy-test01-ssh" {
  org = "${var.vcd_org}" # Optional
  vdc = "${var.vcd_vdc}" # Optional

  edge_gateway = "${var.vcd_edge_name}"
  network_name = "${var.vcd_ext_net}"
  network_type = "ext"

  enabled = true
  logging_enabled = false
  description = "http for proxy"

  original_address   = "${var.vcd_ext_ip1}"
  original_port      = 22

  translated_address = "${vcd_vapp_vm.proxy-test01.network[0].ip}"
  translated_port    = 22
  protocol           = "tcp"
}