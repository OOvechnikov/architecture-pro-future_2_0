service_account_id = "ajeoo7nold0n7rluaqra"
yandex_cloud_id    = "********************"
yandex_cloud_token = "*****************************************"
folder_id          = "********************"

vm_name       = "future-vm-dev"
cpu_cores     = 4
memory_gb     = 8

boot_disk_image_id = "fd8t1bjpm3z7ocqn4hpa"  # Ubuntu 22.04 LTS
boot_disk_size_gb  = 50
boot_disk_type     = "network-ssd"

additional_disk_name    = "future-disk-stage"
additional_disk_size_gb = 100
additional_disk_type    = "network-ssd"
device_name             = "secondary-disk"

availability_zone  = "ru-central1-a"
network_id         = "********************"
subnet_id          = "********************"
enable_nat         = true

create_security_group = true
security_group_name = "vm_sg_stage"
allowed_ssh_cidrs     = ["0.0.0.0/0"]
ssh_user       = "stage-user"
ssh_public_key        = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBu7CahVfYyqmuxUJbjV43wPsPz7RCejE6vQpe0IVpoy"
