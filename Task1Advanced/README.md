### 1. Инициализация окружения

```bash
cd envs/dev/
terraform.exe init
```

### 2. Валидация конфигурации

```bash
terraform.exe validate
```

### 3. Просмотр плана изменений

```bash
terraform.exe plan
```

Планы изменений сохранены в файлы plan.tfplan

### 4. Аналогично для stage и prod

## dev plan.tfplan

```bash
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  + create

Terraform will perform the following actions:

  # module.vm.yandex_compute_disk.additional_disk will be created
  + resource "yandex_compute_disk" "additional_disk" {
      + block_size  = 4096
      + created_at  = (known after apply)
      + folder_id   = (known after apply)
      + id          = (known after apply)
      + name        = "future-disk-dev"
      + product_ids = (known after apply)
      + size        = 50
      + status      = (known after apply)
      + type        = "network-hdd"
      + zone        = "ru-central1-a"

      + disk_placement_policy (known after apply)

      + hardware_generation (known after apply)
    }

  # module.vm.yandex_compute_instance.vm will be created
  + resource "yandex_compute_instance" "vm" {
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hardware_generation       = (known after apply)
      + hostname                  = (known after apply)
      + id                        = (known after apply)
      + maintenance_grace_period  = (known after apply)
      + maintenance_policy        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = (sensitive value)
        }
      + name                      = "future-vm-dev"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v3"
      + service_account_id        = "ajeoo7nold0n7rluaqra"
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd8t1bjpm3z7ocqn4hpa"
              + name        = (known after apply)
              + size        = 30
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + metadata_options (known after apply)

      + network_interface {
          + index          = (known after apply)
          + ip_address     = (known after apply)
          + ipv4           = true
          + ipv6           = (known after apply)
          + ipv6_address   = (known after apply)
          + mac_address    = (known after apply)
          + nat            = true
          + nat_ip_address = (known after apply)
          + nat_ip_version = (known after apply)
          + subnet_id      = "********************"
        }

      + placement_policy (known after apply)

      + resources {
          + core_fraction = 100
          + cores         = 2
          + memory        = 4
        }

      + scheduling_policy (known after apply)
    }

  # module.vm.yandex_vpc_security_group.vm_sg[0] will be created
  + resource "yandex_vpc_security_group" "vm_sg" {
      + created_at  = (known after apply)
      + description = "Security group for future-vm-dev"
      + folder_id   = "********************"
      + id          = (known after apply)
      + labels      = (known after apply)
      + name        = "vm_sg"
      + network_id  = "********************"
      + status      = (known after apply)

      + egress {
          + description       = "Allow all outbound"
          + from_port         = -1
          + id                = (known after apply)
          + labels            = (known after apply)
          + port              = -1
          + protocol          = "ANY"
          + to_port           = -1
          + v4_cidr_blocks    = [
              + "0.0.0.0/0",
            ]
          + v6_cidr_blocks    = []
            # (2 unchanged attributes hidden)
        }

      + ingress {
          + description       = "Allow SSH"
          + from_port         = -1
          + id                = (known after apply)
          + labels            = (known after apply)
          + port              = 22
          + protocol          = "TCP"
          + to_port           = -1
          + v4_cidr_blocks    = [
              + "0.0.0.0/0",
            ]
          + v6_cidr_blocks    = []
            # (2 unchanged attributes hidden)
        }
    }

Plan: 3 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + vm_info = {
      + additional_disk_id = (known after apply)
      + boot_disk_id       = (known after apply)
      + cpu_cores          = 2
      + external_ip        = (known after apply)
      + id                 = (known after apply)
      + internal_ip        = (known after apply)
      + memory_gb          = 4
      + name               = "future-vm-dev"
      + ssh_command        = (known after apply)
    }

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if
you run "terraform apply" now.
```

## stage plan.tfplan

```bash
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  + create

Terraform will perform the following actions:

  # module.vm.yandex_compute_disk.additional_disk will be created
  + resource "yandex_compute_disk" "additional_disk" {
      + block_size  = 4096
      + created_at  = (known after apply)
      + folder_id   = (known after apply)
      + id          = (known after apply)
      + name        = "future-disk-dev"
      + product_ids = (known after apply)
      + size        = 50
      + status      = (known after apply)
      + type        = "network-hdd"
      + zone        = "ru-central1-a"

      + disk_placement_policy (known after apply)

      + hardware_generation (known after apply)
    }

  # module.vm.yandex_compute_instance.vm will be created
  + resource "yandex_compute_instance" "vm" {
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hardware_generation       = (known after apply)
      + hostname                  = (known after apply)
      + id                        = (known after apply)
      + maintenance_grace_period  = (known after apply)
      + maintenance_policy        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = (sensitive value)
        }
      + name                      = "future-vm-dev"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v3"
      + service_account_id        = "ajeoo7nold0n7rluaqra"
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd8t1bjpm3z7ocqn4hpa"
              + name        = (known after apply)
              + size        = 30
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + metadata_options (known after apply)

      + network_interface {
          + index          = (known after apply)
          + ip_address     = (known after apply)
          + ipv4           = true
          + ipv6           = (known after apply)
          + ipv6_address   = (known after apply)
          + mac_address    = (known after apply)
          + nat            = true
          + nat_ip_address = (known after apply)
          + nat_ip_version = (known after apply)
          + subnet_id      = "********************"
        }

      + placement_policy (known after apply)

      + resources {
          + core_fraction = 100
          + cores         = 2
          + memory        = 4
        }

      + scheduling_policy (known after apply)
    }

  # module.vm.yandex_vpc_security_group.vm_sg[0] will be created
  + resource "yandex_vpc_security_group" "vm_sg" {
      + created_at  = (known after apply)
      + description = "Security group for future-vm-dev"
      + folder_id   = "********************"
      + id          = (known after apply)
      + labels      = (known after apply)
      + name        = "vm_sg"
      + network_id  = "********************"
      + status      = (known after apply)

      + egress {
          + description       = "Allow all outbound"
          + from_port         = -1
          + id                = (known after apply)
          + labels            = (known after apply)
          + port              = -1
          + protocol          = "ANY"
          + to_port           = -1
          + v4_cidr_blocks    = [
              + "0.0.0.0/0",
            ]
          + v6_cidr_blocks    = []
            # (2 unchanged attributes hidden)
        }

      + ingress {
          + description       = "Allow SSH"
          + from_port         = -1
          + id                = (known after apply)
          + labels            = (known after apply)
          + port              = 22
          + protocol          = "TCP"
          + to_port           = -1
          + v4_cidr_blocks    = [
              + "0.0.0.0/0",
            ]
          + v6_cidr_blocks    = []
            # (2 unchanged attributes hidden)
        }
    }

Plan: 3 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + vm_info = {
      + additional_disk_id = (known after apply)
      + boot_disk_id       = (known after apply)
      + cpu_cores          = 2
      + external_ip        = (known after apply)
      + id                 = (known after apply)
      + internal_ip        = (known after apply)
      + memory_gb          = 4
      + name               = "future-vm-dev"
      + ssh_command        = (known after apply)
    }

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if
you run "terraform apply" now.
```

## prod plan.tfplan

```bash
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  + create

Terraform will perform the following actions:

  # module.vm.yandex_compute_disk.additional_disk will be created
  + resource "yandex_compute_disk" "additional_disk" {
      + block_size  = 4096
      + created_at  = (known after apply)
      + folder_id   = (known after apply)
      + id          = (known after apply)
      + name        = "future-disk-dev"
      + product_ids = (known after apply)
      + size        = 50
      + status      = (known after apply)
      + type        = "network-hdd"
      + zone        = "ru-central1-a"

      + disk_placement_policy (known after apply)

      + hardware_generation (known after apply)
    }

  # module.vm.yandex_compute_instance.vm will be created
  + resource "yandex_compute_instance" "vm" {
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hardware_generation       = (known after apply)
      + hostname                  = (known after apply)
      + id                        = (known after apply)
      + maintenance_grace_period  = (known after apply)
      + maintenance_policy        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = (sensitive value)
        }
      + name                      = "future-vm-dev"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v3"
      + service_account_id        = "ajeoo7nold0n7rluaqra"
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd8t1bjpm3z7ocqn4hpa"
              + name        = (known after apply)
              + size        = 30
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + metadata_options (known after apply)

      + network_interface {
          + index          = (known after apply)
          + ip_address     = (known after apply)
          + ipv4           = true
          + ipv6           = (known after apply)
          + ipv6_address   = (known after apply)
          + mac_address    = (known after apply)
          + nat            = true
          + nat_ip_address = (known after apply)
          + nat_ip_version = (known after apply)
          + subnet_id      = "********************"
        }

      + placement_policy (known after apply)

      + resources {
          + core_fraction = 100
          + cores         = 2
          + memory        = 4
        }

      + scheduling_policy (known after apply)
    }

  # module.vm.yandex_vpc_security_group.vm_sg[0] will be created
  + resource "yandex_vpc_security_group" "vm_sg" {
      + created_at  = (known after apply)
      + description = "Security group for future-vm-dev"
      + folder_id   = "********************"
      + id          = (known after apply)
      + labels      = (known after apply)
      + name        = "vm_sg"
      + network_id  = "********************"
      + status      = (known after apply)

      + egress {
          + description       = "Allow all outbound"
          + from_port         = -1
          + id                = (known after apply)
          + labels            = (known after apply)
          + port              = -1
          + protocol          = "ANY"
          + to_port           = -1
          + v4_cidr_blocks    = [
              + "0.0.0.0/0",
            ]
          + v6_cidr_blocks    = []
            # (2 unchanged attributes hidden)
        }

      + ingress {
          + description       = "Allow SSH"
          + from_port         = -1
          + id                = (known after apply)
          + labels            = (known after apply)
          + port              = 22
          + protocol          = "TCP"
          + to_port           = -1
          + v4_cidr_blocks    = [
              + "0.0.0.0/0",
            ]
          + v6_cidr_blocks    = []
            # (2 unchanged attributes hidden)
        }
    }

Plan: 3 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + vm_info = {
      + additional_disk_id = (known after apply)
      + boot_disk_id       = (known after apply)
      + cpu_cores          = 2
      + external_ip        = (known after apply)
      + id                 = (known after apply)
      + internal_ip        = (known after apply)
      + memory_gb          = 4
      + name               = "future-vm-dev"
      + ssh_command        = (known after apply)
    }

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if
you run "terraform apply" now.
```