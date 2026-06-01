# Infrastructure as Code (Yandex Cloud + GitLab CI)

## Предварительные требования

Для работы пайплайна необходимо создать ресурсы в Yandex Object Storage вручную:

1. **Сервисный аккаунт (SA)** для Terraform с ролью `editor` (или `admin`) на каталог.
2. **Статический ключ доступа** для доступа к S3 бакету для SA из п.1.
3. **Бакет в Object Storage** в примере 7ea5d56e-a107-4141-9759-0f7e21ecd094.
4. **Каталог для состояния** в примере dev.

## Настройка GitLab CI/CD Variables

В GitLab CI/CD нужно добавить перменные окружения:

| Переменная               | Описание |
|--------------------------|-|
| `YC_ACCESS_KEY`          | Идентификатор статического ключа доступа (Access Key ID) для S3 бакета |
| `YC_SECRET_KEY`          | Секретный ключ доступа (Secret Access Key) для S3 бакета |
| `YC_SERVICE_ACCOUNT_KEY` | JSON-содержимое ключа сервисного аккаунта (файл authorized_key.json) с правами на управление ресурсами |

### Получение переменных:

#### 1. `YC_ACCESS_KEY` и `YC_SECRET_KEY` (для S3 backend):
```bash
# Создайте статический ключ доступа для сервисного аккаунта
yc iam access-key create --service-account-name terraform-sa
# Запишите полученные key_id (ACCESS_KEY) и secret (SECRET_KEY)
````
#### 2. YC_SERVICE_ACCOUNT_KEY (для провайдера):
```bash
# Создайте авторизованный JSON ключ
yc iam key create \
--service-account-name terraform-sa \
--format json \
--output sa-key.json

# Выведите содержимое (одной строкой для CI)
jq -c . sa-key.json
# Скопируйте вывод целиком в переменную GitLab CI
```

## Работа с пайплайном

1. **Commit & Push**: Любое изменение в ветке запускает стадию `plan`.
2. **Review**: В логах задачи можно проверить планируемые изменения Terraform.
3. **Apply**: Ручное применение плана после проверки.


## Пример вывода plan

```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  + create

Terraform will perform the following actions:

  # yandex_vpc_network.develop_network will be created
  + resource "yandex_vpc_network" "develop_network" {
      + created_at                = (known after apply)
      + default_security_group_id = (known after apply)
      + folder_id                 = (known after apply)
      + id                        = (known after apply)
      + labels                    = (known after apply)
      + name                      = "future-network"
      + subnet_ids                = (known after apply)
    }

  # yandex_vpc_subnet.develop_subnet will be created
  + resource "yandex_vpc_subnet" "develop_subnet" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "future-network-subnet-a"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "0.0.0.0/0",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }

Plan: 2 to add, 0 to change, 0 to destroy.
```
