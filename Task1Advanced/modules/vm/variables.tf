# Параметры ВМ
variable "vm_name" {
  description = "Имя виртуальной машины"
  type        = string
  validation {
    condition     = length(var.vm_name) > 0 && length(var.vm_name) <= 63
    error_message = "Имя ВМ должно быть от 1 до 63 символов."
  }
}

variable "cpu_cores" {
  description = "Количество ядер процессора"
  type        = number
  validation {
    condition     = contains([2, 4], var.cpu_cores)
    error_message = "Допустимые значения: 2, 4."
  }
}

variable "memory_gb" {
  description = "Объём оперативной памяти в гигабайтах"
  type        = number
  validation {
    condition     = var.memory_gb >= 1 && var.memory_gb <= 16
    error_message = "Объём RAM должен быть от 1 до 16 ГБ."
  }
}

variable "availability_zone" {
  description = "Зона доступности"
  type        = string
  default     = "ru-central1-a"
  validation {
    condition     = contains(["ru-central1-a", "ru-central1-b"], var.availability_zone)
    error_message = "Недопустимая зона доступности."
  }
}

variable "platform_id" {
  description = "ID платформы вычисления"
  type        = string
  default     = "standard-v3"
}

# Параметры загрузочного диска
variable "boot_disk_image_id" {
  description = "ID образа для загрузочного диска"
  type        = string
}

variable "boot_disk_size_gb" {
  description = "Размер загрузочного диска в ГБ"
  type        = number
  default     = 50
  validation {
    condition     = var.boot_disk_size_gb >= 10 && var.boot_disk_size_gb <= 128
    error_message = "Размер диска должен быть от 10 до 128 ГБ."
  }
}

variable "boot_disk_type" {
  description = "Тип загрузочного диска (network-hdd, network-ssd)"
  type        = string
  default     = "network-hdd"
  validation {
    condition     = contains(["network-hdd", "network-ssd"], var.boot_disk_type)
    error_message = "Допустимые типы: network-hdd, network-ssd."
  }
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

# Сетевые параметры
variable "subnet_id" {
  description = "ID подсети для подключения ВМ"
  type        = string
}

variable "network_id" {
  description = "ID VPC сети"
  type        = string
}

variable "enable_nat" {
  description = "Включить NAT для ВМ"
  type        = bool
  default     = true
}

# SSH
variable "ssh_public_key" {
  description = "Публичный SSH-ключ для доступа к ВМ"
  type        = string
  sensitive   = true
  validation {
    condition     = length(var.ssh_public_key) > 0
    error_message = "SSH-ключ не должен быть пустым."
  }
}

variable "ssh_user" {
  description = "SSH-пользователь"
  type        = string
  validation {
    condition     = length(var.ssh_user) > 0
    error_message = "SSH-пользователь не должен быть пустым."
  }
}

variable "create_security_group" {
  description = "Создавать ли группу безопасности"
  type        = bool
  default     = true
}

variable "security_group_name" {
  description = "Имя группы безопасности"
  type        = string
  default     = "vm-sg"
}

variable "allowed_ssh_cidrs" {
  description = "CIDR блоки для разрешения SSH доступа"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# Параметры аккаунта
variable "service_account_id" {
  description = "ID сервисного аккаунта"
  type        = string
  default     = ""
}

variable "folder_id" {
  description = "ID папки в Yandex Cloud"
  type        = string
}

# Окружение
variable "environment" {
  description = "Окружение (dev, stage, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "stage", "prod"], var.environment)
    error_message = "Окружение должно быть dev, stage или prod."
  }
}
