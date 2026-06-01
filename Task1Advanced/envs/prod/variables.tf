variable "yandex_cloud_id" {
  description = "ID облака Yandex Cloud"
  type        = string
}

variable "yandex_cloud_token" {
  description = "Yandex Cloud OAuth token"
  type        = string
  sensitive   = true
}

variable "folder_id" {
  description = "ID папки в Yandex Cloud"
  type        = string
}

variable "availability_zone" {
  description = "Зона доступности"
  type        = string
  default     = "ru-central1-a"
}

variable "vm_name" {
  description = "Имя ВМ"
  type        = string
}

variable "cpu_cores" {
  description = "Количество ядер процессора"
  type        = number
}

variable "memory_gb" {
  description = "Объём оперативной памяти в ГБ"
  type        = number
}

variable "boot_disk_image_id" {
  description = "ID образа для загрузочного диска"
  type        = string
}

variable "boot_disk_size_gb" {
  description = "Размер загрузочного диска в ГБ"
  type        = number
  default     = 50
}

variable "boot_disk_type" {
  description = "Тип загрузочного диска"
  type        = string
  default     = "network-hdd"
}

variable "additional_disk_name" {
  description = "Имя дополнительного диска"
  type        = string
}

variable "additional_disk_size_gb" {
  description = "Размер дополнительного диска в ГБ"
  type        = number
}

variable "additional_disk_type" {
  description = "Тип дополнительного диска"
  type        = string
  default     = "network-hdd"
}

variable "device_name" {
  description = "Имя устройства"
  type        = string
  default     = "secondary-disk"
}

variable "subnet_id" {
  description = "ID подсети"
  type        = string
}

variable "network_id" {
  description = "ID VPC сети"
  type        = string
}

variable "static_ip_address" {
  description = "Статический IP-адрес"
  type        = string
  default     = ""
}

variable "enable_nat" {
  description = "Включить NAT"
  type        = bool
  default     = true
}

variable "ssh_public_key" {
  description = "Публичный SSH-ключ"
  type        = string
  sensitive   = true
}

variable "ssh_user" {
  description = "SSH-пользователь"
  type        = string
}

variable "create_security_group" {
  description = "Название группы безопасности"
  type        = bool
  default     = true
}

variable "security_group_name" {
  description = "Название группы безопасности"
  type        = string
}

variable "allowed_ssh_cidrs" {
  description = "CIDR блоки для SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "service_account_id" {
  description = "ID сервисного аккаунта"
  type        = string
  default     = ""
}
