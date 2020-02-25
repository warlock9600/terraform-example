resource "vcd_vapp_vm" "db-test01" {
  vapp_name     = "${vcd_vapp.backend.name}"
  name          = "db-test01"
  catalog_name  = "Public"
  template_name = "UbuntuServer-18.04-LTS"
  memory        = 1024
  cpus          = 1
  cpu_cores     = 1

  network {
    type               = "org"
    name               = "backend"
    ip                 = "10.200.10.5"
    ip_allocation_mode = "MANUAL"
    is_primary         = true
  }

  depends_on = [vcd_network_routed.backend]


resource "vcd_vapp_vm" "web-test01" {
  vapp_name     = "${vcd_vapp.frontend.name}"
  name          = "web-test01"
  catalog_name  = "Public"
  template_name = "UbuntuServer-18.04-LTS"
  memory        = 1024
  cpus          = 1
  cpu_cores     = 1

  network {
    type               = "org"
    name               = "frontend"
    ip                 = "10.200.20.5"
    ip_allocation_mode = "MANUAL"
    is_primary         = true
  }

  depends_on = [vcd_network_routed.frontend]
}

resource "vcd_vapp_vm" "web-test02" {
  vapp_name     = "${vcd_vapp.frontend.name}"
  name          = "web-test02"
  catalog_name  = "Public"
  template_name = "UbuntuServer-18.04-LTS"
  memory        = 1024
  cpus          = 1
  cpu_cores     = 1

  network {
    type               = "org"
    name               = "frontend"
    ip                 = "10.200.20.6"
    ip_allocation_mode = "MANUAL"
    is_primary         = true
  }

  depends_on = [vcd_network_routed.frontend]
}

resource "vcd_vapp_vm" "proxy-test01" {
  vapp_name     = "${vcd_vapp.dmz.name}"
  name          = "proxy-test01"
  catalog_name  = "Public"
  template_name = "UbuntuServer-18.04-LTS"
  memory        = 1024
  cpus          = 1
  cpu_cores     = 1

  network {
    type               = "org"
    name               = "dmz"
    ip                 = "10.200.30.5"
    ip_allocation_mode = "MANUAL"
    is_primary         = true
  }

  depends_on = [vcd_network_routed.dmz]
}