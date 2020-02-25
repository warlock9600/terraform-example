resource "vcd_vapp" "backend" {
  name             = "backend"
}

resource "vcd_vapp" "frontend" {
  name             = "frontend"
}

resource "vcd_vapp" "dmz" {
  name             = "dmz"
}