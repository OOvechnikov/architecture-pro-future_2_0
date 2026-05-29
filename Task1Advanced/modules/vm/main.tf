terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.174.0"
    }
  }
}

resource "yandex_compute_instance" "vm" {
  name           = var.vm_name
  platform_id    = var.platform_id
  zone           = var.availability_zone
  service_account_id = var.service_account_id

  resources {
    cores  = var.cpu_cores
    memory = var.memory_gb
  }

  boot_disk {
    initialize_params {
      image_id = var.boot_disk_image_id
      size     = var.boot_disk_size_gb
      type     = var.boot_disk_type
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = var.enable_nat
    ip_address = null
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${var.ssh_public_key}"
  }

  depends_on = [yandex_compute_disk.additional_disk]
}

resource "yandex_compute_disk" "additional_disk" {
  name       = var.additional_disk_name
  size       = var.additional_disk_size_gb
  type       = var.additional_disk_type
  zone       = var.availability_zone
  image_id   = null
}

resource "yandex_vpc_security_group" "vm_sg" {
  count           = var.create_security_group ? 1 : 0
  name            = var.security_group_name
  description     = "Security group for ${var.vm_name}"
  network_id      = var.network_id
  folder_id       = var.folder_id

  ingress {
    protocol       = "TCP"
    description    = "Allow SSH"
    v4_cidr_blocks = var.allowed_ssh_cidrs
    port           = 22
  }

  egress {
    protocol       = "ANY"
    description    = "Allow all outbound"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}