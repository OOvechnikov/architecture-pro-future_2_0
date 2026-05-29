terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.174.0"
    }
  }
}

provider "yandex" {
  token     = var.yandex_cloud_token
  cloud_id  = var.yandex_cloud_id
  folder_id = var.folder_id
  zone      = var.availability_zone
}

module "vm" {
  source = "../../modules/vm"

  vm_name              = var.vm_name
  cpu_cores            = var.cpu_cores
  memory_gb            = var.memory_gb
  boot_disk_image_id   = var.boot_disk_image_id
  boot_disk_size_gb    = var.boot_disk_size_gb
  boot_disk_type       = var.boot_disk_type
  availability_zone    = var.availability_zone

  additional_disk_name      = var.additional_disk_name
  additional_disk_size_gb   = var.additional_disk_size_gb
  additional_disk_type      = var.additional_disk_type
  device_name               = var.device_name

  subnet_id              = var.subnet_id
  network_id             = var.network_id
  enable_nat             = var.enable_nat

  ssh_public_key         = var.ssh_public_key
  ssh_user               = var.ssh_user
  create_security_group  = var.create_security_group
  security_group_name    = var.security_group_name
  allowed_ssh_cidrs      = var.allowed_ssh_cidrs

  service_account_id     = var.service_account_id
  folder_id              = var.folder_id
  environment            = "prod"

  providers = {
    yandex = yandex
  }
}

output "vm_info" {
  description = "Информация о развёрнутой ВМ"
  value = {
    id                 = module.vm.vm_id
    name               = module.vm.vm_name
    internal_ip        = module.vm.internal_ip_address
    external_ip        = module.vm.external_ip_address
    boot_disk_id       = module.vm.boot_disk_id
    additional_disk_id = module.vm.additional_disk_id
    cpu_cores          = module.vm.cpu_cores
    memory_gb          = module.vm.memory_gb
    ssh_command        = module.vm.ssh_command
  }
}
