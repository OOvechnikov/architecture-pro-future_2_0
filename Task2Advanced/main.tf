terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.174.0"
    }
  }

  backend "s3" {
    endpoint   = "https://storage.yandexcloud.net"
    bucket     = "7ea5d56e-a107-4141-9759-0f7e21ecd094"
    region     = "ru-central1"
    key        = "env/terraform.tfstate" # Путь к файлу состояния

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}

provider "yandex" {
  zone = var.zone
      token     = var.yandex_cloud_token
      cloud_id  = var.yandex_cloud_id
      folder_id = var.folder_id
}

resource "yandex_vpc_network" "develop_network" {
  name      = "future-network"
}

resource "yandex_vpc_subnet" "develop_subnet" {
  name               = "future-network-subnet-a"
  zone               = var.zone
  network_id         = yandex_vpc_network.develop_network.id
  v4_cidr_blocks     = ["0.0.0.0/0"]
}
