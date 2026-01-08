# Студентський Блог Проект

Це навчальний Django проект для студентів курсу Python/Django.

## Опис проекту

Простий блог з можливістю створення постів та коментарів. Проект створений спеціально для практики роботи з Django та розв'язання типових проблем, з якими стикаються розробники.

## Встановлення

### 1. Клонування репозиторію

```bash
git clone <url-репозиторію>
cd student_blog_project
```

### 2. Створення віртуального середовища

```bash
python -m venv venv
source venv/bin/activate  # для macOS/Linux
# або
venv\Scripts\activate  # для Windows
```

### 3. Встановлення залежностей

```bash
pip install -r requirements.txt
```

### 4. Запуск міграцій

```bash
python manage.py migrate
```

### 5. Створення суперкористувача

```bash
python manage.py createsuperuser
```

### 6. Запуск сервера

```bash
python manage.py runserver
```

Відкрийте браузер і перейдіть за адресою: http://127.0.0.1:8000

## Запуск з Docker

### 1. Переконайтесь що Docker запущено

Перевірте що Docker Desktop запущено на вашому комп'ютері.

### 2. Скопіюйте .env файл

```bash
cp .env .env
```

Відредагуйте `.env` файл та встановіть потрібні значення.

### 3. Збудуйте та запустіть контейнери

```bash
docker-compose build
docker-compose up -d
```

### 4. Застосуйте міграції

```bash
docker-compose exec web python manage.py migrate
```

### 5. Створіть суперкористувача

```bash
docker-compose exec web python manage.py createsuperuser
```

### 6. Відкрийте браузер

Перейдіть за адресою: http://localhost:8000

### Корисні Docker команди

```bash
# Показати логи
docker-compose logs -f

# Зупинити контейнери
docker-compose down

# Перезапустити
docker-compose restart

# Видалити все включно з даними
docker-compose down -v
```

Або використовуйте Makefile:
```bash
make help    # Показати всі доступні команди
make build   # Збудувати образи
make up      # Запустити контейнери
make logs    # Показати логи
make down    # Зупинити
```

## Структура проекту

```
student_blog_project/
├── blog/                   # Основний додаток блогу
│   ├── models.py          # Моделі Post та Comment
│   ├── views.py           # Views для відображення постів
│   ├── urls.py            # URL маршрути
│   ├── admin.py           # Налаштування адмін панелі
│   └── templates/         # HTML шаблони
├── blog_project/          # Головна папка проекту
│   ├── settings.py        # Налаштування Django
│   └── urls.py            # Головні URL маршрути
├── static/                # Статичні файли (CSS, JS, зображення)
└── manage.py              # Django management скрипт
```

## Функціональність

- Перегляд списку постів блогу
- Детальний перегляд окремого посту
- Додавання коментарів до постів
- Адміністративна панель для керування контентом

## Технології

- Python 3.x
- Django 4.2.7
- SQLite (база даних)
- HTML/CSS

