.PHONY: help build up down migrate superuser test shell

help:
	@echo "Comandos disponíveis:"
	@echo "make build       - Construir os containers Docker"
	@echo "make up          - Iniciar os containers"
	@echo "make down        - Parar os containers"
	@echo "make migrate     - Aplicar migrações do Django"
	@echo "make superuser   - Criar um superusuário Django"
	@echo "make test        - Rodar testes"
	@echo "make shell       - Abrir shell no container web"

build:
	docker-compose build

up:
	docker-compose up

down:
	docker-compose down

migrate:
	docker-compose exec web python manage.py migrate

superuser:
	docker-compose exec web python manage.py createsuperuser

test:
	docker-compose exec web python manage.py test

shell:
	docker-compose exec web python manage.py shell