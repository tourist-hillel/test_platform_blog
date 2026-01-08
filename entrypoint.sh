#!/bin/bash

echo "Waiting for PostgreSQL..."
while ! nc -z db 5432; do
  sleep 0.1
done

echo "PostgreSQL started"

python manage.py migrate

python manage.py collectstatic

python manage.py createsuperuser --username admin --email admin@example.com

exec "$@"
