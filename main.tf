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
  memory              = "3G"
  disk                = "15G"
  wait_for_cloud_init = true

  cloud_init = <<-EOT
    #cloud-config
    package_update: true
    packages:
      - ca-certificates
      - curl
      - gnupg

    runcmd:
      - install -m 0755 -d /etc/apt/keyrings
      - curl -fsSL https://docker.com | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
      - chmod a+r /etc/apt/keyrings/docker.gpg
      - echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://docker.com $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
      - apt-get update
      - apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
      - usermod -aG docker ubuntu
      - systemctl enable --now docker
  EOT
}
