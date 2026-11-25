terraform {
  required_providers {
    multipass = {
      source  = "todoroff/multipass"
      version = ">= 1.0.0"
    }
  }
}

resource "multipass_instance" "ubuntu_server" {
  name                = "server-geosanbox-infra"
  image               = "22.04"
  cpus                = 2
  memory              = "2.5G"
  disk                = "10G"
  wait_for_cloud_init = true
}
