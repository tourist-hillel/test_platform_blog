.PHONY: help build up down restart logs shell migrate makemigrations createsuperuser test clean

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

restart:
	docker-compose restart

logs:
	docker-compose logs -f

shell:
	docker-compose exec web python manage.py shell

bash:
	docker-compose exec web bash

migrate:
	docker-compose exec web python manage.py migrate

makemigrations:
	docker-compose exec web python manage.py makemigrations

createsuperuser:
	docker-compose exec web python manage.py createsuperuser

test:
	docker-compose exec web python manage.py test

collectstatic:
	docker-compose exec web python manage.py collectstatic --noinput

clean:
	docker-compose down -v
	rm -rf __pycache__
	find . -name "*.pyc" -delete

run-local:
	python manage.py runserver

reset-db:
	rm -f db.sqlite3
	python manage.py migrate
	python manage.py createsuperuser
