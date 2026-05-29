### Агрегаты медицинского домена

### Patient (Пациент)

**Границы**: Демографические данные, контакты, основные медицинские данные \
**Ключ**: PatientId (UUID) \
**Инварианты**:

- Уникальный идентификатор пациента
- Обязательные поля: ФИО, дата рождения, пол
- Контактная информация
- Пациент не может быть удален, только деактивирован

**События**: PatientRegistered, PatientUpdated, PatientDeactivated

### Appointment (Прием)

**Границы**: Запись на прием, статус, участники \
**Ключ**: AppointmentId (UUID) \
**Инварианты**:

- Должен быть связан с не деактивированным пациентом
- Должен быть связан с врачом
- Время начала должно быть раньше времени окончания
- Нельзя изменить завершенный прием

**События**: AppointmentScheduled, AppointmentCancelled, AppointmentCompleted

### MedicalRecord (Медицинская запись)

**Границы**: История болезни, диагнозы, назначения \
**Ключ**: MedicalRecordId (UUID) \
**Инварианты**:

- Должен быть связан с пациентом
- Каждая запись должна иметь временную метку
- Диагноз должен иметь код по МКБ
- Лекарственные назначения должны иметь дозировку

**События**: MedicalRecordCreated, DiagnosisAdded, PrescriptionAdded

### Analysis (Исследование)

**Границы**: Диагностическое исследование, результаты \
**Ключ**: AnalysisId (UUID) \
**Инварианты**:

- Должен быть связан с пациентом
- Должен иметь тип исследования (МРТ, КТ, УЗИ)

**События**: AnalysisAssigned, AnalysisStarted, AnalysisCompleted

### Агрегаты финансового домена

### Account (Счет)

**Границы**: Баланс, операции, владелец \
**Ключ**: AccountId (UUID) \
**Инварианты**:

- Баланс не может быть отрицательным
- Каждая операция должна быть авторизована
- Счет должен быть связан с клиентом

**События**: AccountCreated, AccountClosed, BalanceChanged, TransactionInitiated, TransactionCompleted

### Payment (Платеж)

**Границы**: Сумма, участники, статус
**Ключ**: PaymentId (UUID)
**Инварианты**:

- Сумма должна быть положительной
  **События**: PaymentInitiated, PaymentCompleted, PaymentFailed

### Агрегаты аналитического домена

### DataProduct (Продукт данных)

**Границы**: Метаданные, схема, SLA \
**Ключ**: DataProductId (UUID) \
**Инварианты**:

- Должен иметь владельца (домен)
- SLA должно быть определено

**События**: DataProductCreated, DataProductSchemaUpdated, DataProductSlaReached

### Report (Отчет)

**Границы**: Параметры, данные, визуализация \
**Ключ**: ReportId (UUID) \
**Инварианты**:

- Должен иметь инициатора
  **События**: ReportRequested, ReportCreated

### MlModel (ML модель)

**Границы**: Данные для обучения, оценки точности, публикация \
**Ключ**: ModelId (UUID) \
**Инварианты**:

- Порог точности модели

**События**: ModelTrainingStarted, ModelTrainingCompleted, ModelMetricsCalculated, ModelDeployed, ModelDeprecated
