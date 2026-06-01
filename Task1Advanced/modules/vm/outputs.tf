# Информация об основной ВМ
output "vm_id" {
  description = "ID виртуальной машины"
  value       = yandex_compute_instance.vm.id
}

output "vm_name" {
  description = "Имя виртуальной машины"
  value       = yandex_compute_instance.vm.name
}

output "vm_fqdn" {
  description = "Полное доменное имя ВМ"
  value       = yandex_compute_instance.vm.fqdn
}

# IP-адреса
output "internal_ip_address" {
  description = "Внутренний IP-адрес ВМ"
  value       = yandex_compute_instance.vm.network_interface[0].ip_address
}

output "external_ip_address" {
  description = "Внешний IP-адрес ВМ (NAT)"
  value       = try(yandex_compute_instance.vm.network_interface[0].nat_ip_address, "")
}

# Информация о загрузочном диске
output "boot_disk_id" {
  description = "ID загрузочного диска"
  value       = yandex_compute_instance.vm.boot_disk[0].disk_id
}

output "boot_disk_size" {
  description = "Размер загрузочного диска в ГБ"
  value       = yandex_compute_instance.vm.boot_disk[0].initialize_params[0].size
}

output "additional_disk_id" {
  description = "ID дополнительного диска"
  value       = yandex_compute_disk.additional_disk.id
}

output "additional_disk_size" {
  description = "Размер дополнительного диска в ГБ"
  value       = yandex_compute_disk.additional_disk.size
}

output "additional_disk_status" {
  description = "Статус дополнительного диска"
  value       = yandex_compute_disk.additional_disk.status
}

# Параметры вычисления
output "cpu_cores" {
  description = "Количество ядер процессора"
  value       = var.cpu_cores
}

output "memory_gb" {
  description = "Объём оперативной памяти в ГБ"
  value       = var.memory_gb
}

# Статус ВМ
output "vm_status" {
  description = "Текущий статус ВМ"
  value       = yandex_compute_instance.vm.status
}

output "vm_created_at" {
  description = "Время создания ВМ"
  value       = yandex_compute_instance.vm.created_at
}

# Информация о группе безопасности
output "security_group_id" {
  description = "ID группы безопасности"
  value       = try(yandex_vpc_security_group.vm_sg[0].id, "")
}

# Метаданные
output "vm_labels" {
  description = "Метки (labels) ВМ"
  value       = yandex_compute_instance.vm.labels
}

output "environment" {
  description = "Окружение, в котором развёрнута ВМ"
  value       = var.environment
}

# Команда подключения по SSH
output "ssh_command" {
  description = "Команда для подключения к ВМ по SSH"
  value       = "ssh -i ./ssh-key-1765035448816 future-user@${try(yandex_compute_instance.vm.network_interface[0].nat_ip_address, yandex_compute_instance.vm.network_interface[0].ip_address)}"
}
