variable "zone" {
  description = "Yandex Cloud default Zone"
  type        = string
  default     = "ru-central1-a"
}

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

variable "service_account_id" {
  description = "ID сервисного аккаунта"
  type        = string
  default     = ""
}

variable "service_account_key" {
  description = "Service account key JSON"
  type        = string
  sensitive   = true
  default     = ""
}