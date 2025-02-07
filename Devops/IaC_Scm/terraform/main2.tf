terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.70.1"
    }
  }
}


resource "proxmox_virtual_environment_file" "user_data_cloud_config" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = var.proxmox_host

  source_raw {
    data = <<-EOF
    #cloud-config
    hostname: test-ubuntu
    users:
      - default
      - name: etienne
        groups:
          - sudo
        shell: /bin/bash
        ssh_authorized_keys:
          - ${trimspace(var.ssh_key)}
        sudo: ALL=(ALL) NOPASSWD:ALL
    runcmd:
        - apt update
        - apt install -y qemu-guest-agent net-tools
        - timedatectl set-timezone Europe/Moscow
        - systemctl enable qemu-guest-agent
        - systemctl start qemu-guest-agent
        - echo "done" > /tmp/cloud-config.done
    EOF

    file_name = "user-data-cloud-config.yaml"
  }
}

provider "proxmox" {
  endpoint          = "https://10.90.123.200:8006/api2/json"
#   api_token    = "terraform@pam!terraform_id=eca2dbb0-6ba1-493b-8cf0-04f97bd13506"
  api_token     = "terraform@pam!terraform-privileged=90fd1ff0-0091-4489-b3dd-b47190d6b623"
  insecure     = true
  ssh {
    agent = true
    username = "root"
  }
}

# resource is formatted to be "[type]" "[entity_name]" so in this case
# we are looking to create a proxmox_vm_qemu entity named test_server

resource "proxmox_virtual_environment_vm" "test-vm" {
  name = "test-vm-1" #count.index starts at 0, so + 1 means this VM will be named test-vm-1 in proxmox
  node_name = var.proxmox_host
   agent {
    enabled = true
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 2048
  }

  disk {
    datastore_id = "local-lvm"
    file_id      = proxmox_virtual_environment_download_file.noble-server-cloudimg-amd64.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 20
  }

  initialization {
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id
  }

  network_device {
    bridge = "vmbr0"
  }

  
}

resource "proxmox_virtual_environment_download_file" "noble-server-cloudimg-amd64" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = var.proxmox_host
  url          = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
  overwrite    = false

}

output "vm_ipv4_address" {
  value = proxmox_virtual_environment_vm.test-vm.ipv4_addresses[1][0]
}