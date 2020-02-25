resource "vcd_network_routed" "backend" {
  org  = "${var.vcd_org}"
  vdc  = "${var.vcd_vdc}"

  name = "backend"
  edge_gateway = "brusdemo2_EDGE"

  gateway = "10.200.10.1"

  static_ip_pool {
    start_address = "10.200.10.152"
    end_address   = "10.200.10.254"
  }

}

resource "vcd_network_routed" "frontend" {
  org  = "${var.vcd_org}"
  vdc  = "${var.vcd_vdc}"

  name = "frontend"
  edge_gateway = "brusdemo2_EDGE"

  gateway = "10.200.20.1"

  static_ip_pool {
    start_address = "10.200.20.152"
    end_address   = "10.200.20.254"
  }

}

resource "vcd_network_routed" "dmz" {
  org  = "${var.vcd_org}"
  vdc  = "${var.vcd_vdc}"

  name = "dmz"
  edge_gateway = "brusdemo2_EDGE"

  gateway = "10.200.30.1"

  static_ip_pool {
    start_address = "10.200.30.152"
    end_address   = "10.200.30.254"
  }

}